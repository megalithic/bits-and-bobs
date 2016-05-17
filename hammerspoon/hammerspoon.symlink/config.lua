local config = {}
local screenCount = #hs.screen.allScreens()
local grid = hs.grid
local utils = require 'utils'
local hostname = hs.host.localizedName()
grid.setGrid("12x12")
grid.setMargins({w = 2, h = 2})
hs.window.animationDuration = 0 -- 0 to disable animations
-- hs.window.setShadows(false)

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
  centeredHuge = '1,1 10x10',
  centeredBig = '3,3 6x6',
  centeredSmall = '4,4 4x4'
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
    utils.activate('com.googlecode.iterm2') -- Make sure iTerm in front of everything.
  end),

  ['com.kapeli.dashdoc'] = (function(window, forceScreenCount)
    grid.set(window, config.grid.centerBig)
  end),

  ['com.tinyspeck.slackmacgap'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    if count == 1 then
      grid.set(window, config.grid.rightHalf)
    else
      grid.set(window, config.grid.rightThird, config.secondaryDisplay(count))
    end
  end),

  ['com.nylas.nylas-mail'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    if count == 1 then
      grid.set(window, config.grid.leftHalf)
    else
      grid.set(window, config.grid.leftTwoThirds, config.secondaryDisplay(count))
    end
  end),

  ['google-play-music-desktop-player'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    grid.set(window, '8,0 4x8', config.secondaryDisplay(count))
  end),

  ['com.sajidanwar.Radiant-Player'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    grid.set(window, '8,0 4x8', config.secondaryDisplay(count))
  end),

  ['com.spotify.client'] = (function(window, forceScreenCount)
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

  ['com.agilebits.onepassword4'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    grid.set(window, config.grid.centeredBig, config.primaryDisplay(count))
  end),

  ['2BUA8C4S2C.com.agilebits.onepassword4-helper'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    grid.set(window, config.grid.centeredSmall, config.secondaryDisplay(count))
  end),

  ['com.google.Chrome'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    if count == 1 then
      grid.set(window, config.grid.fullScreen, config.primaryDisplay(count))
    else
      if window:title() == 'Postman' then
        grid.set(window, config.grid.centeredHuge, config.secondaryDisplay(count))
      else
        -- set original/first chrome window to the left and let the next
        -- grid.set() to handle the rest..
        grid.set(window, config.getGridLocation(window, count), config.secondaryDisplay(count))
      end
    end
  end),

  ['com.googlecode.iterm2'] = (function(window, forceScreenCount)
    if config.isFullScreen(window) then
      window:setFullScreen(false)
    else
      window:setFullScreen(true)
    end
  end)
}


-- Helpers
--------------------------------------------------------------------------------
-- NOTE: if you have more than 2 displays, please
-- alter the following display functions as necessary
function config.primaryDisplay(count)
  local primary = hostname == 'replibox' and config.screens.primary or config.screens.laptop

  if count > 1 then
    local positionForPrimary = {
      x = config.screens.primary:position(),
      y = 0
    }
    primary = positionForPrimary
  end

  -- utils.log.df('[screens] targeted primary %s at %s (%s screens)', hs.screen.find(primary):name(), primary, screenCount)
  return hs.screen.find(primary)
end

function config.secondaryDisplay(count)
  local secondary = hostname == 'replibox' and config.screens.secondary or config.screens.laptop

  local positionForSecondary = {
    x = config.screens.secondary:position(),
    y = 0
  }
  secondary = positionForSecondary

  if count == 1 then
    secondary = hostname == 'replibox' and config.screens.primary or config.screens.laptop
  end

  utils.log.df('[screens] targeted secondary %s at %s (%s screens)', hs.screen.find(secondary):name(), secondary.x or secondary, screenCount)
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
  -- TODO: account for existing windows for layout

  -- we have more than one screen attached
  if (count > 1) then
    local windowCount = utils.windowCount(app)

    -- we have more than one window for the given app
    if (windowCount > 1) then
      -- local gw = grid.GRIDWIDTH
      -- local gh = grid.GRIDHEIGHT
      -- local goMiddle = {x = gw/4, y = gh/4, w = gw/2, h = gh/2}
      -- local goLeft = {x = gw, y = 0, w = gw/2, h = gh}
      -- local goRight = {x = gw/2, y = 0, w = gw/2, h = gh}
      -- local goTopLeft = {x = 0, y = 0, w = gw/2, h = gh/2}
      -- grid.set(window, goRight, config.secondaryDisplay(count))

      side = windowCount % 2 == 0 and config.grid.rightHalf or config.grid.leftHalf
    end
  end

  utils.log.df('[wm] set %s to grid %s', app:bundleID(), side)

  return side
end

function config.activateLayout(screenCountOverride)
  config.layout._before_()

  for bundleID, callback in pairs(config.layout) do
    local application = hs.application.get(bundleID)
    if application then
      local windows = application:visibleWindows()
      for _, window in pairs(windows) do
        if utils.canManageWindow(window) then
          utils.log.df('[layout] activating layout with screenCountOverride (%s)', screenCountOverride)
          callback(window, screenCountOverride)
        end
      end
    end
  end

  config.layout._after_()
end

return config
