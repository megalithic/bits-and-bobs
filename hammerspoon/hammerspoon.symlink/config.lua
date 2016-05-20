-------------------------------------------------------------------------------
--/ configurations /--
-------------------------------------------------------------------------------
local config = {}
config.hostname = hs.host.localizedName()
config.homeSSID = 'shaolin'
config.lastSSID = hs.wifi.currentNetwork()

-- :: imports/requires
local grid = hs.grid
local utils = require 'utils'

-- :: locals
local screenCount = #hs.screen.allScreens()

-- :: grid creation
hs.grid.GRIDWIDTH = 8
hs.grid.GRIDHEIGHT = 8
hs.grid.MARGINX = 2
hs.grid.MARGINY = 2

-- :: settings
hs.window.animationDuration = 0 -- 0 to disable animations
hs.window.setShadows(true)

-- :: screens
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
  topHalf =         '0,0 8x4',
  rightHalf =       '4,0 4x8',
  bottomHalf =      '0,4 8x4',
  leftHalf =        '0,0 4x8',
  rightOneThird =   '5,0 3x8',
  rightTwoThirds =  '3,0 5x8',
  leftOneThird =    '0,0 3x8',
  leftTwoThirds =   '0,0 5x8',
  fullScreen =      '0,0 8x8',
  centeredLarge =   '1,1 6x6',
  centeredMedium =  '2,2 4x4',
  centeredSmall =   '3,3 2x2',
}

-- LAYOUT SETUP
-------------------------------------------------------------------------------
config.layout = {
  _before_ = (function()
  end),

  _after_ = (function()
    utils.activate('com.google.Chrome')
    utils.activate('com.googlecode.iterm2') -- iTerm2 is front-most
  end),

  ['com.tinyspeck.slackmacgap'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    if count == 1 then
      grid.set(window, config.grid.rightHalf)
    else
      grid.set(window, config.grid.rightOneThird, config.secondaryDisplay(count))
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

  ['com.spotify.client'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    grid.set(window, '5,0 5x5', config.secondaryDisplay(count))
  end),

  ['com.apple.iChat'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    if count == 1 then
      grid.set(window, '5,5 3x3', config.primaryDisplay(count))
    else
      grid.set(window, '5,5 3x3', config.secondaryDisplay(count))
    end
  end),

  ['com.agilebits.onepassword4'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    grid.set(window, config.grid.centeredMedium, config.primaryDisplay(count))
  end),

  ['org.hammerspoon.Hammerspoon'] = (function(window, forceScreenCount)
     local count = forceScreenCount or screenCount
     grid.set(window, config.grid.centeredMedium, config.primaryDisplay(count))
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
        grid.set(window, config.grid.centeredLarge, config.secondaryDisplay(count))
      else
        grid.set(window, config.grid.fullScreen, config.primaryDisplay(count))
      end
    end
  end),

  ['com.mozilla.Firefox'] = (function(window, forceScreenCount)
    local count = forceScreenCount or screenCount
    if count == 1 then
      grid.set(window, config.grid.fullScreen, config.primaryDisplay(count))
    else
      if window:title() == 'Postman' then
        grid.set(window, config.grid.centeredLarge, config.secondaryDisplay(count))
      else
        grid.set(window, config.grid.fullScreen, config.primaryDisplay(count))
      end
    end
  end),

  -- FIXME: presently iTerm2 handles it's own placement :confused:
  -- sooooooo, we ignore trying to fight iTerm2 for now.
  --
  -- ['com.googlecode.iterm2'] = (function(window, forceScreenCount)
  --   if config.isFullScreen(window) then
  --     window:setFullScreen(false)
  --   else
  --     window:setFullScreen(true)
  --   end
  -- end)
}


-- Helpers
--------------------------------------------------------------------------------
-- NOTE: if you have more than 2 displays, please
-- alter the following display functions as necessary
function config.primaryDisplay(count)
  if (hostname == 'replibox') then
    return hs.screen.find(config.screens.primary)
  end

  return hs.screen.find(config.screens.laptop)
end

function config.secondaryDisplay(count)
  if (hostname == 'replibox') then
    return hs.screen.find(config.screens.secondary)
  end

  return hs.screen.find(config.screens.laptop)
end

-- Checks to see if the current window is fullscreen or not
function config.isFullScreen(window)
  local wf = window:frame()
  local sf = window:screen():fullFrame()
  return (wf == sf)
end

-- Applies our given window/screen layouts for apps
function config.applyLayout(screenCountOverride)
  local count = screenCountOverride or screenCount

  utils.log.df('[layout] event; applying layouts for %s screens', count)
  config.layout._before_()

  for bundleID, callback in pairs(config.layout) do
    local application = hs.application.get(bundleID)
    if application then
      local windows = application:visibleWindows()
      for _, window in pairs(windows) do
        if utils.canManageWindow(window) then
          utils.log.df('[layout] event; layout applied for app: %s, window: %s, screen count: %s', application:name(), window, count)
          callback(window, count)
        end
      end
    end
  end

  config.layout._after_()
end

return config
