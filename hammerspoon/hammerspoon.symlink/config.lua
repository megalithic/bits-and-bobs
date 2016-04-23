local config = {}
local screenCount = #hs.screen.allScreens()
local grid = hs.grid
local utils = require 'utils'
grid.setGrid("12x12")
grid.setMargins({w = 3, h = 4})
hs.window.animationDuration = 0 -- 0 to disable animations
hs.window.setShadows(false)

-- SCREEN SETUP
-------------------------------------------------------------------------------
local primary = hs.screen:primaryScreen()
local secondary = primary:previous()
config.screens = {
  laptop = 'Built-in Retina Display',
  primary = primary,
  secondary = secondary
}

-- GRID SETUP
-------------------------------------------------------------------------------
config.grid = {
  topHalf = '0,0 12x6',
  topThird = '0,0 12x4',
  topTwoThirds = '0,0 12x8',
  rightHalf = '6,0 6x12',
  rightThird = '8,0 4x12',
  rightTwoThirds = '4,0 8x12',
  bottomHalf = '0,6 12x6',
  bottomThird = '0,8 12x4',
  bottomTwoThirds = '0,4 12x8',
  leftHalf = '0,0 6x12',
  leftThird = '0,0 4x12',
  leftTwoThirds = '0,0 8x12',
  topLeft = '0,0 6x6',
  topRight = '6,0 6x6',
  topRightThird = '8,0 4x4',
  bottomRight = '6,6 6x6',
  bottomRightThird = '8,8 4x4',
  bottomLeft = '0,6 6x6',
  fullScreen = '0,0 12x12',
  centeredBig = '3,3 6x6',
  centeredSmall = '4,4 4x4',
}

-- LAYOUT SETUP
-------------------------------------------------------------------------------
config.layout = {
  _before_ = (function()
    -- utils.hide('com.apple.iChat')
    -- config.hide('google-play-music-desktop-player')
  end),

  _after_ = (function()
    utils.activate('com.google.Chrome')
    -- Make sure  iTerm in front of everything.
    utils.activate('com.googlecode.iterm2')
  end),

  -- we have a default so that unspecified app windows do something sane and expected
  ['default'] = (function(window, forceScreenCount)
    -- local count = forceScreenCount or screenCount
    -- if count == 1 then
    --   grid.set(window, config.grid.centerBig)
    -- else
    --   grid.set(window, config.grid.rightThird, config.secondaryDisplay(count))
    -- end

    grid.set(window, config.grid.centerBig)
  end),

  ['com.tinyspeck.slackmacgap'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    if count == 1 then
      grid.set(window, config.grid.rightThird)
    else
      grid.set(window, config.grid.rightThird, config.secondaryDisplay(count))
    end
  end),

  ['com.nylas.nylas-mail'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    if count == 1 then
      grid.set(window, config.grid.fullScreen)
    else
      grid.set(window, config.grid.leftTwoThirds, config.secondaryDisplay(count))
    end
  end),

  ['google-play-music-desktop-player'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    grid.set(window, '8,0 4x8', config.secondaryDisplay(count))
  end),

  ['com.apple.iChat'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    if count == 1 then
      grid.set(window, '8,8 4x4', config.primaryDisplay(count))
    else
      grid.set(window, '8,8 4x4', config.secondaryDisplay(count))
    end
  end),

  ['com.nylas.nylas-mail'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    if count == 1 then
      grid.set(window, config.grid.leftTwoThirds, config.primaryDisplay(count))
    else
      grid.set(window, config.grid.leftTwoThirds, config.secondaryDisplay(count))
    end
  end),

  ['com.agilebits.onepassword4'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    grid.set(window, config.grid.centeredBig, config.primaryDisplay(count))
  end),

  ['com.google.Chrome'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    if count == 1 then
      grid.set(window, config.getGridLocation(window, count), config.primaryDisplay(count))
    else
      grid.set(window, config.getGridLocation(window, count), config.secondaryDisplay(count))
    end
  end),

  ['com.googlecode.iterm2'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    if count == 1 then
      grid.set(window, config.grid.fullScreen)
    else
      if config.isFullScreen(window) then
        window:setFullScreen(false)
      else
        window:setFullScreen(true)
      end
    end
  end)
}


-- Helpers
--------------------------------------------------------------------------------
-- NOTE: if you have more than 2 displays, please
-- alter the following display functions as necessary
function config.primaryDisplay(count)
  local primary = config.screens.laptop

  if count > 1 then
    local positionForPrimary = {
      x = config.screens.primary:position(),
      y = 0
    }
    primary = positionForPrimary
  end

  local position = primary == config.screens.laptop and 0 or primary.x
  local name = primary == config.screens.laptop and primary or hs.screen.find(primary):name()

  utils.log.df('[wm] targeted primary %s at %s (%s screens)', name, position, screenCount)
  return hs.screen.find(primary)
end

function config.secondaryDisplay(count)
  local secondary = {
    x = config.screens.secondary:position(),
    y = 0
  }

  -- assumes the laptop screen when only one screen found
  if count == 1 then
    secondary = config.screens.laptop
  end

  utils.log.df('[wm] targeted secondary %s at %s (%s screens)', hs.screen.find(secondary):name(), secondary.x, screenCount)
  return hs.screen.find(secondary)
end

--=================================================================================
-- WARNING: the following methods shouldn't be changed
--=================================================================================

-- Checks to see if the current window is fullscreen or not
function config.isFullScreen(window)
  local wf = window:frame()
  local sf = window:screen():fullFrame()
  return (wf == sf)
end


function config.getGridLocation (window, count)
  local app = window:application()
  local side = config.grid.fullScreen

  -- we have more than one screen attached
  if (count > 1) then
    local windowCount = utils.windowCount(app)

    -- we have more than one window for the given app
    if (windowCount > 1) then
      side = windowCount % 2 == 0 and config.grid.rightHalf or config.grid.leftHalf
    end
  end

  utils.log.df('[wm] set %s to grid %s', app:bundleID(), side)

  return side
end

function config.activateLayout(forceScreenCount)
  config.layout._before_()

  for bundleID, callback in pairs(config.layout) do
    local application = bundleID ~= 'default' or hs.application.get(bundleID)
    if application then
      local windows = application:visibleWindows()
      for _, window in pairs(windows) do
        if utils.canManageWindow(window) then
          callback(window, forceScreenCount)
        end
      end
    end
  end

  config.layout._after_()
end

return config
