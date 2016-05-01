-------------------------------------------------------------------------------
--/ initialize /--
-------------------------------------------------------------------------------

-- :: requires / imports
local wm = require 'wm'
local utils = require 'utils'
-- local layout = require 'layout'
local config = require 'config'
keys = require 'keys'

-- :: apis
local wf = hs.window.filter

-- :: locals
local wf = hs.window.filter
local screenCount = #hs.screen.allScreens()
local windowBorder = nil
local frameCache = {}
local primary = hs.screen:primaryScreen()
local secondary = primary:previous()

-- :: globals
basePath = os.getenv('HOME') .. '/.hammerspoon/'
imagePath = basePath .. 'assets/'
hostname = hs.host.localizedName()
screens = {
  laptop = 'Built-in Retina Display',
  alpha = primary,
  omega = secondary
}

-- :: watchers
local configFileWatcher = nil
local applicationWatcher = nil
local screenWatcher = nil
local windowWatcher = nil

-- :: logging
local log = hs.logger.new('--/ replicant /==', 'debug')

-- :: settings
hs.ipc.cliInstall()

-- :: mashers
cmdAlt = {'cmd', 'alt'}
cmdShift = {'cmd', 'shift'}
cmdCtrl = {'cmd', 'ctrl'}
ctrlAlt = {'ctrl', 'alt'}
hyper = {'cmd', 'ctrl', 'shift'}
mash = {'cmd', 'alt', 'ctrl'}
mashShift = {'cmd', 'alt', 'ctrl', 'shift' }



-- watcher handlers
-- -------------------------------------------------------------------------

-- :: application watcher
function handleApplicationWatcher (appName, eventType, appObject)
  log.df("handleApplicationWatcher(%s, %s, %s)", appName, eventType, appObject)

  if (eventType == hs.application.watcher.activated) then
    -- Original code that handled this eventType:
    -- https://github.com/cmsj/hammerspoon-config/blob/master/init.lua#L257
  elseif (eventType == hs.application.watcher.launching) then
    -- Original code that handled this eventType:
    -- https://github.com/cmsj/hammerspoon-config/blob/master/init.lua#L272
  elseif (eventType == hs.application.watcher.terminated) then
    -- Original code that handled this eventType:
    -- https://github.com/cmsj/hammerspoon-config/blob/master/init.lua#L281
  end
end


-- :: screen watcher
function handleScreenWatcher ()
  log.df("handleScreenWatcher()")

--[[
  -- from csmj config:
  newNumberOfScreens = #hs.screen.allScreens()
  -- FIXME: This is awful if we swap primary screen to the external display.
  --  all the windows swap around, pointlessly.
  if lastNumberOfScreens ~= newNumberOfScreens then
    if newNumberOfScreens == 1 then
      hs.layout.apply(internal_display)
    elseif newNumberOfScreens == 2 then
      hs.layout.apply(dual_display)
    end
  end
  lastNumberOfScreens = newNumberOfScreens
--]]

  -- Make sure that something noteworthy (display count) actually changed.
  --  We no longer check geometry because we were seeing spurious events.
  local screens = hs.screen.allScreens()
  if not (#screens == screenCount) then
    screenCount = #screens
    activateLayout(screenCount)
  end
end

-- :: config file watcher
function handleConfigFileWatcher (files)
  if configFileWatcher ~= nil then
    configFileWatcher:stop()
    configFileWatcher = nil
  end

  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end

  if doReload then
    hs.reload()
    hs.notify.show('Hammerspoon', 'Config reload complete', '')
  end
end


-- window filter subscriptions
----------------------------------------------------------------------------

allWindows = wf.new(nil, 'allWindows')
allWindows:subscribe(wf.windowCreated, function() drawBorder() end)
allWindows:subscribe(wf.windowFocused, function() drawBorder() end)
allWindows:subscribe(wf.windowMoved, function() drawBorder() end)
allWindows:subscribe(wf.windowUnfocused, function() drawBorder() end)
allWindows:subscribe(wf.windowOnScreen, function() drawBorder() end)
allWindows:subscribe(wf.windowNotOnScreen, function() drawBorder() end)


-- window filter handlers
----------------------------------------------------------------------------

function drawBorder ()
  -- clean up existing borders
  if windowBorder ~= nil then
    windowBorder:delete()
  end

  local ignoredWindows = utils.Set {'iTerm2', 'Electron Helper', 'TotalFinderCrashWatcher', 'CCXProcess', 'Adobe CEF Helper', 'Hammerspoon'}
  local win = hs.window.focusedWindow()

  -- avoid drawing borders on "odd" windows, including iTerm2, Contexts, etc
  if win == nil or not utils.canManageWindow(win) or ignoredWindows[win:application():name()] then return end

  local topLeft = win:topLeft()
  local size = win:size()

  windowBorder = hs.drawing.rectangle(hs.geometry.rect( topLeft['x'], topLeft['y'], size['w'], size['h']))

  windowBorder:setStrokeColor({["red"]=0,["blue"]=.2,["green"]=.1,["alpha"]=.1})
  windowBorder:setRoundedRectRadii(6.0, 6.0)
  windowBorder:setStrokeWidth(2)
  windowBorder:setStroke(true)
  windowBorder:setFill(false)
  windowBorder:setLevel("floating")
  windowBorder:show()
end


-- layout handlers
----------------------------------------------------------------------------

function applyLayout (forceScreenCount)
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


-- layouts
----------------------------------------------------------------------------
--   Format reminder:
--     {"App name", "Window name", "Display Name", "unitrect", "framerect", "fullframerect"},

local custom = {
  centerSmall = {"iTunes", "MiniPlayer", display_imac, nil, nil, hs.geometry.rect(0, -48, 400, 48)},
  centerBig = {},
  bottomLeftQuarter = {},
  bottomLeftHalf = {},
  bottomRightQuarter = {},
  bottomRightHalf = {},
  topLeftQuarter = {},
  topLeftHalf = {},
  topRightQuarter = {},
  topRightHalf = {},
}

local laptop = {
  {"iTerm2",                            nil,          screens.laptop, hs.layout.maximized, nil, nil},
  {"Google Chrome",                     nil,          screens.laptop, hs.layout.maximized, nil, nil},
  {"Nylas N1",                          nil,          screens.laptop, hs.layout.left50, nil, nil},
  {"Slack",                             nil,          screens.laptop, hs.layout.right50, nil, nil},
  {"1Password",                         nil,          screens.laptop, hs.layout.maximized, nil, nil},
  {"Fantastical 2",                     nil,          screens.laptop, hs.layout.maximized, nil, nil},
  {"Messages",                          nil,          screens.laptop, hs.layout.maximized, nil, nil},
  {"Google Play Music Desktop Player",  nil,          screens.laptop, hs.layout.maximized, nil, nil},
}

local desktop = {
  {"iTerm2",                            nil,          screens.alpha, hs.layout.maximized, nil, nil},
  {"Google Chrome",                     nil,          screens.omega, hs.layout.maximized, nil, nil},
  {"Nylas N1",                          nil,          screens.omega, hs.layout.left50, nil, nil},
  {"Slack",                             nil,          screens.omega, hs.layout.right50, nil, nil},
  {"1Password",                         nil,          screens.alpha, hs.geometry.unitrect(0, 0.5, 3/8, 0.5), nil, nil},
  {"Fantastical 2",                     nil,          screens.alpha, hs.geometry.unitrect(0.75, 0, 0.25, 0.95), nil, nil},
  {"Messages",                          nil,          screens.omega, hs.geometry.unitrect(3/8, 0.5, 3/8, 0.5), nil, nil},
  {"Google Play Music Desktop Player",  nil,          screens.omega, hs.geometry.unitrect(0, 0.25, 3/8, 0.25), nil, nil},
}


-- key bindings
----------------------------------------------------------------------------

-- :: misc
hs.hotkey.bind({'cmd', 'ctrl', 'shift'}, 'L', function()
  hs.caffeinate.startScreensaver()
end)
hs.hotkey.bind(ctrlAlt, 'r', function() hs.toggleConsole() end)
hs.hotkey.bind(cmdCtrl, "r", function()
  hs.notify.show('Hammerspoon', 'Config Reloaded', '')
  hs.reload()
end)

-- :: media
-- / uses (newly added) hs.eventtap.event.newSystemKeyEvent()
-- / https://github.com/Hammerspoon/hammerspoon/commit/a8ad4974777edc5b5db19176faf9dd2fe7b65c6f
local mediaApp = {
  name='Goole Play Music Desktop Player',
  bundleID='google-play-music-desktop-player'
}
-- insert key on ducky shine 3
hs.hotkey.bind('ctrl', 114, function() hs.eventtap.event.newSystemKeyEvent('PREVIOUS', true):post() end)
-- home key on ducky shine 3
hs.hotkey.bind('ctrl', 115, function() hs.eventtap.event.newSystemKeyEvent('PLAY', true):post() end)
-- pageup key on ducky shine 3
hs.hotkey.bind('ctrl', 116, function() hs.eventtap.event.newSystemKeyEvent('NEXT', true):post() end)

-- :: apps
hs.hotkey.bind('ctrl', 'space', function() utils.toggleApp('com.googlecode.iterm2') end)
hs.hotkey.bind({'cmd'}, '`', function() utils.toggleApp('com.google.Chrome') end)
hs.hotkey.bind({'cmd'}, 'f4', function() utils.toggleApp('com.nylas.nylas-mail') end)
hs.hotkey.bind({'cmd'}, 'f5', function() utils.toggleApp('tweetbot') end)
hs.hotkey.bind({'cmd'}, 'f8', function() utils.toggleApp('google-play-music-desktop-player') end)
hs.hotkey.bind(cmdShift, 'f8', function() utils.toggleApp('com.sajidanwar.Radiant-Player') end)
hs.hotkey.bind({'cmd', 'shift'}, 'M', function() utils.toggleApp('com.apple.iChat') end)

-- https://github.com/cmsj/hammerspoon-config/blob/master/init.lua#L616
hs.hotkey.bind(cmdCtrl, 'n', function() hs.task.new("/usr/bin/open", nil, {os.getenv("HOME")}):start() end)

-- :: sub-app
-- / Chrome Dev Tools
hs.hotkey.bind('', 'F12', function ()
  local win = hs.window.focusedWindow()
  if win ~= nil and win:application():bundleID() == 'com.google.Chrome' then
    hs.eventtap.keyStroke({'cmd', 'alt'}, "i")
  end
end)


-- window manipulation
----------------------------------------------------------------------------
--
hs.hotkey.bind(cmdCtrl, 'h', utils.chain({
  wm.config.grid.leftHalf,
  wm.config.grid.leftThird,
  wm.config.grid.leftTwoThirds,
  }))

hs.hotkey.bind(cmdCtrl, 'j', utils.chain({
  wm.config.grid.bottomHalf,
  wm.config.grid.bottomThird,
  wm.config.grid.bottomTwoThirds,
  }))

hs.hotkey.bind(cmdCtrl, 'k', utils.chain({
  wm.config.grid.fullScreen,
  wm.config.grid.centeredBig,
  wm.config.grid.centeredSmall,
  }))

-- hs.hotkey.bind(cmdCtrl, 'h', wm.grid.leftHalf)
-- hs.hotkey.bind(cmdCtrl, 'l', wm.grid.rightHalf)
-- hs.hotkey.bind(cmdCtrl, 'k', wm.grid.maximize)
-- hs.hotkey.bind(cmdCtrl, 'j', wm.grid.center)

-- hs.hotkey.bind(cmdCtrl, 'j', utils.chain({
--   wm.config.grid.bottomHalf,
--   wm.config.grid.bottomThird,
--   wm.config.grid.bottomTwoThirds,
--   }))

-- hs.hotkey.bind(cmdCtrl, 'k', utils.chain({
--   wm.config.grid.fullScreen,
--   wm.config.grid.centeredBig,
--   wm.config.grid.centeredSmall,
--   }))

-- hs.hotkey.bind(cmdCtrl, 'h', utils.chain({
--   wm.config.grid.leftHalf,
--   wm.config.grid.leftThird,
--   wm.config.grid.leftTwoThirds,
--   }))

-- hs.hotkey.bind(cmdCtrl, 'l', utils.chain({
--   wm.config.grid.rightHalf,
--   wm.config.grid.rightThird,
--   wm.config.grid.rightTwoThirds,
--   }))

hs.hotkey.bind(ctrlAlt, 'k', utils.chain({
  wm.config.grid.topHalf,
  wm.config.grid.topThird,
  wm.config.grid.topTwoThirds,
  }))

hs.hotkey.bind(ctrlAlt, 'j', utils.chain({
  wm.config.grid.topLeft,
  wm.config.grid.topRight,
  wm.config.grid.bottomRight,
  wm.config.grid.bottomLeft,
  }))

-- / move windows between monitors
hs.hotkey.bind(ctrlAlt, 'h', function ()
  local win = hs.window.focusedWindow()
  local nextScreen = win:screen():previous()
  win:moveToScreen(nextScreen)
  end)

hs.hotkey.bind(ctrlAlt, 'l', function ()
  local win = hs.window.focusedWindow()
  local nextScreen = win:screen():next()
  win:moveToScreen(nextScreen)
  end)

-- / activate multi-monitor layouts
hs.hotkey.bind(cmdCtrl, 'f1', function ()
  hs.notify.show('Window Management', 'Switching Layouts', 'Loaded Laptop Layout')
  wm.config.activateLayout(1)
  end)
hs.hotkey.bind(cmdCtrl, 'f2', function ()
  hs.notify.show('Window Management', 'Switching Layouts', 'Loaded Desktop Layout')
  wm.config.activateLayout(2)
  end)


-- watcher starters
-- -------------------------------------------------------------------------

-- :: applications
applicationWatcher = hs.application.watcher.new(handleApplicationWatcher)
applicationWatcher:start()

-- :: config files
configFileWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", handleConfigFileWatcher):start()
configFileWatcher:start()

-- :: screens
screenWatcher = hs.screen.watcher.new(handleScreenWatcher)
screenWatcher:start()


-- misc
-- -------------------------------------------------------------------------

print("++ Running: "..hs.processInfo.bundlePath)
print("++ Accessibility: "..tostring(hs.accessibilityState()))

collectgarbage("setstepmul", 1000)
collectgarbage("setpause", 1)
