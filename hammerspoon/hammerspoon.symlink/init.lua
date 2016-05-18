-------------------------------------------------------------------------------
--/ initialize /--
-------------------------------------------------------------------------------

-- :: imports/requires
local utils = require 'utils'
-- local wm = require 'wm'
-- local config = require 'config'

-- :: globals
basePath = os.getenv('HOME') .. '/.hammerspoon/'
imagePath = basePath .. 'assets/'
hostname = hs.host.localizedName()
windowBorder = nil

-- :: locals
local applicationWatcher = nil
local screenWatcher = nil
local wifiWatcher = nil
local usbWatcher = nil
local caffeinateWatcher = nil
-- local configFileWatcher = nil

local wf = hs.window.filter
local newNumberOfScreens = #hs.screen.allScreens()
local frameCache = {}

local primary = hs.screen:primaryScreen()
local secondary = primary:previous()

local homeSSID = 'shaolin'
local lastSSID = hs.wifi.currentNetwork()

-- Ensure the IPC command line client is available
hs.ipc.cliInstall()

-- :: settings
require("hs.hotkey").setLogLevel("warning")
hs.window.animationDuration = 0 -- 0 to disable animations

-- :: grid setup
hs.grid.GRIDWIDTH = 4
hs.grid.GRIDHEIGHT = 4
hs.grid.MARGINX = 2
hs.grid.MARGINY = 2


-- window layouts
-- :: {"app name", "win name", "disp name", "unitrect", "framerect", "fullframerect"}
----------------------------------------------------------------------------

local custom_layouts = {
  chrome = {"Google Chrome",    nil,  secondary, hs.layout.maximized, nil, nil},
  nylasN1 = {"Nylas N1",        nil,  secondary, hs.geometry.unitrect(0,    0,    0.60, 1), nil, nil},
  spotify = {"Spotify",         nil,  secondary, hs.geometry.unitrect(0.60, 0,    0.40, 0.60), nil, nil},
  messages = {"Messages",       nil,  secondary, hs.geometry.unitrect(0.60, 0.60, 0.40, 0.40), nil, nil},
  slack = {"Slack",             nil,  secondary, hs.geometry.unitrect(0.60, 0,    0.40, 1), nil, nil},
}

local laptop_display = {
  custom_layouts.chrome,
  {"Nylas N1",          nil,          secondary, hs.layout.left50,    nil, nil},
  {"Slack",             nil,          secondary, hs.layout.right50,   nil, nil},
  {"Spotify",           nil,          secondary, hs.geometry.unitrect(0.50, 0,    0.50, 0.50), nil, nil},
  {"Messages",          nil,          secondary, hs.geometry.unitrect(0.50, 0.50, 0.50, 0.50), nil, nil},
}

local single_display = {
  custom_layouts.chrome,
  {"Nylas N1",          nil,          secondary, hs.layout.left50,    nil, nil},
  {"Slack",             nil,          secondary, hs.layout.right50,   nil, nil},
  {"Spotify",           nil,          secondary, hs.geometry.unitrect(0.50, 0,    0.50, 0.50), nil, nil},
  {"Messages",          nil,          secondary, hs.geometry.unitrect(0.50, 0.50, 0.50, 0.50), nil, nil},
}

local dual_display = {
  custom_layouts.chrome,
  custom_layouts.nylasN1,
  custom_layouts.spotify,
  custom_layouts.messages,
  custom_layouts.slack,
}


-- watcher handlers/callbacks
-- :: {"app name", "win name", "disp name", "unitrect", "framerect", "fullframerect"}
----------------------------------------------------------------------------

-- APPLICATION
function applicationHandler (appName, eventType, appObject)

  if (eventType == hs.application.watcher.activated) then
    utils.log.df('[application] event; incoming watcher event, "activated"')
    if (appName == "Finder") then
      -- Bring all Finder windows forward when one gets activated
      appObject:selectMenuItem({"Window", "Bring All to Front"})
    end
  elseif (eventType == hs.application.watcher.deactivated) then
    utils.log.df('[application] event; incoming watcher event, "deactivated"')
  elseif (eventType == hs.application.watcher.hidden) then
    utils.log.df('[application] event; incoming watcher event, "hidden"')
  elseif (eventType == hs.application.watcher.unhidden) then
    utils.log.df('[application] event; incoming watcher event, "unhidden"')
  elseif (eventType == hs.application.watcher.launching) then
    utils.log.df('[application] event; incoming watcher event, "launching"')
  elseif (eventType == hs.application.watcher.launched) then
    utils.log.df('[application] event; incoming watcher event, "launched"')
    screenHandler()
  elseif (eventType == hs.application.watcher.terminated) then
    utils.log.df('[application] event; incoming watcher event, "terminated"')
    screenHandler()
  end
end

-- SCREEN
function screenHandler ()
  newNumberOfScreens = #hs.screen.allScreens()

  utils.log.df('[screen] event; new number of screens, %s', newNumberOfScreens)

  -- FIXME: This is awful if we swap primary screen to the external display. all the windows swap around, pointlessly.
  if lastNumberOfScreens ~= newNumberOfScreens then
    if newNumberOfScreens == 1 then
      if hostname == 'replibook' then
        utils.log.df('[screen] event; applying layout "laptop_display"')
        hs.layout.apply(laptop_display)
      else
        utils.log.df('[screen] event; applying layout "single_display"')
        hs.layout.apply(single_display)
      end
    elseif newNumberOfScreens == 2 then
      utils.log.df('[screen] event; applying layout "dual_display"')
      hs.layout.apply(dual_display)
    end
  end

  lastNumberOfScreens = newNumberOfScreens
end

-- WIFI
function wifiHandler ()
  newSSID = hs.wifi.currentNetwork()

  utils.log.df('[wifi] event; old SSID (%s), new SSID (%s)', lastSSID or "nil", newSSID or "nil")

  -- print("ssidChangedCallback: old:"..(lastSSID or "nil").." new:"..(newSSID or "nil"))
  if newSSID == homeSSID and lastSSID ~= homeSSID then
    -- We have gone from something that isn't my home WiFi, to something that is
    -- home_arrived()
  elseif newSSID ~= homeSSID and lastSSID == homeSSID then
    -- We have gone from something that is my home WiFi, to something that isn't
    -- home_departed()
  end

  lastSSID = newSSID
end

-- USB
function usbHandler (data)
  utils.log.df('[usb] event; raw data %s', hs.inspect(data))

  -- print("usbDeviceCallback: "..hs.inspect(data))
  -- if (data["productName"] == "ScanSnap S1300i") then
  --   event = data["eventType"]
  --   if (event == "added") then
  --     hs.application.launchOrFocus("ScanSnap Manager")
  --   elseif (event == "removed") then
  --     app = hs.appfinder.appFromName("ScanSnap Manager")
  --     app:kill()
  --   end
  -- end
end

-- CAFFEINATE
function caffeinateHandler (eventType)
  utils.log.df('[caffeine] event; raw event data %s', eventType)

  if (eventType == hs.caffeinate.watcher.screensDidSleep) then
    -- if hs.itunes.isPlaying() then
    --   hs.itunes.pause()
    -- end
    -- local output = hs.audiodevice.defaultOutputDevice()
    -- if output:muted() then
    --   shouldUnmuteOnScreenWake = false
    -- else
    --   shouldUnmuteOnScreenWake = true
    -- end
    -- output:setMuted(true)
  elseif (eventType == hs.caffeinate.watcher.screensDidWake) then
    -- if shouldUnmuteOnScreenWake then
    --   hs.audiodevice.defaultOutputDevice():setMuted(false)
    -- end
  end
end

-- TEARDOWN
function tearDownWatcherHandling ()
  applicationWatcher:stop()
  applicationWatcher = nil

  screenWatcher:stop()
  screenWatcher = nil

  wifiWatcher:stop()
  wifiWatcher = nil

  usbWatcher:stop()
  usbWatcher = nil

  caffeinateWatcher:stop()
  caffeinateWatcher = nil
end

-- TOGGLE the given app
function toggleApp (_app)
  -- accepts app name (lowercased), pid, or bundleID; but we ALWAYS use bundleID
  local app = hs.application.find(_app)

  if app ~= nil then
    utils.log.df('[application] event; attempting to toggle %s', app:bundleID())
  end

  if not app then
    -- FIXME: this may not be working properly.. creating extraneous PIDs?
    utils.log.df('[application] event; launchOrFocusByBundleID(%s) (not PID-managed app?)', _app)
    hs.application.launchOrFocusByBundleID(_app)
  else
    local mainWin = app:mainWindow()
    utils.log.df('[application] event; mainWin: %s', mainWin)
    if mainWin then
      if mainWin == hs.window.focusedWindow() then
        utils.log.df('[application] event; hiding %s', app:bundleID())
        mainWin:application():hide()
      else
        utils.log.df('[application] event; activating/unhiding/focusing %s', app:bundleID())
        mainWin:application():activate(true)
        mainWin:application():unhide()
        mainWin:focus()
      end
    else
      -- assumes there is no "mainWindow" for the application in question, probably iTerm2
      utils.log.df('[application] event; launchOrFocusByBundleID(%s)', app)
      if (app:focusedWindow() == hs.window.focusedWindow()) then
        app:hide()
      else
        app:unhide()
        hs.application.launchOrFocusByBundleID(app:bundleID())
      end
    end
  end
end


-- window filter subscriptions
-- :: watch relevant window events to do interesting things
----------------------------------------------------------------------------

allWindows = wf.new(nil, 'allWindows')
allWindows:subscribe(wf.windowCreated, function(win, appName, eventType) handleCreated(win, appName, eventType) end)
allWindows:subscribe(wf.windowFocused, function(win, appName, eventType) handleFocused(win, appName, eventType) end)
allWindows:subscribe(wf.windowMoved, function(win, appName, eventType) handleMoved(win, appName, eventType) end)
allWindows:subscribe(wf.windowUnfocused, function(win, appName, eventType) handleUnfocused(win, appName, eventType) end)
allWindows:subscribe(wf.windowOnScreen, function(win, appName, eventType) handleOnScreen(win, appName, eventType) end)
allWindows:subscribe(wf.windowNotOnScreen, function(win, appName, eventType) handleNotOnScreen(win, appName, eventType) end)
-- allWindows:subscribe(wf.windowsChanged, function(win, appName) handleWindowsChanged(win, appName) end)


-- window filter eventhandlers
----------------------------------------------------------------------------

function handleCreated (win, appName, eventType)
  utils.log.df('[window] event "%s"; %s for %s', eventType, win:title(), appName)

  if win ~= nil then
    screenHandler()
    windowHandler(win, appName, eventType)
    drawWindowBorder(win)
  end
end

function handleFocused (win, appName, eventType)
  utils.log.df('[window] event "%s"; %s for %s', eventType, win:title(), appName)

  if win ~= nil then
    drawWindowBorder(win)
  end
end

function handleMoved (win, appName, eventType)
  utils.log.df('[window] event "%s"; %s for %s', eventType, win:title(), appName)

  if win ~= nil then
    screenHandler()
    drawWindowBorder(win)
  end
end

function handleUnfocused (win, appName, eventType)
  utils.log.df('[window] event "%s"; %s for %s', eventType, win:title(), appName)

  if win ~= nil then
    drawWindowBorder(win)
  end
end

function handleOnScreen (win, appName, eventType)
  utils.log.df('[window] event "%s"; %s for %s', eventType, win:title(), appName)

  if win ~= nil then
    drawWindowBorder(win)
  end
end

function handleNotOnScreen (win, appName, eventType)
  utils.log.df('[window] event "%s"; %s for %s', eventType, win:title(), appName)

  if win ~= nil then
    drawWindowBorder(win)
  end
end


-- window filter helpers
----------------------------------------------------------------------------

function windowHandler (win, appName, eventType)
  if eventType == 'windowCreated' then
    -- local allWindowsForApp = utils.validWindowsForWindow(win)
    -- utils.log.df('FOOOOOOO %s %s', #allWindowsForApp, allWindowsForApp)
  end
end

function drawWindowBorder (win)
  -- clean up existing borders
  if windowBorder ~= nil then
    windowBorder:delete()
  end

  local ignoredWindows = utils.Set {'iTerm2', 'Electron Helper', 'TotalFinderCrashWatcher', 'CCXProcess', 'Adobe CEF Helper', 'Hammerspoon'}
  -- local win = (win ~= nil) and win or hs.window.focusedWindow()

  -- avoid drawing borders on "odd" windows, including iTerm2, Contexts, etc
  if win == nil or not utils.canManageWindow(win) or ignoredWindows[win:application():name()] then return end

  local topLeft = win:topLeft()
  local size = win:size()

  windowBorder = hs.drawing.rectangle(hs.geometry.rect(topLeft['x'], topLeft['y'], size['w'], size['h']))

  windowBorder:setStrokeColor({["red"]=.5,["blue"]=.2,["green"]=.1,["alpha"]=.1})
  windowBorder:setRoundedRectRadii(6.0, 6.0)
  windowBorder:setStrokeWidth(2)
  windowBorder:setStroke(true)
  windowBorder:setFill(false)
  windowBorder:setLevel("floating")
  windowBorder:show()
end


-- key bindings
-------------------------------------------------------------------------------

-- :: mashers (alt == opt)
cmdAlt = {'cmd', 'alt'}
cmdShift = {'cmd', 'shift'}
cmdCtrl = {'cmd', 'ctrl'}
ctrlAlt = {'ctrl', 'alt'}
mashShift = {'cmd', 'ctrl', 'shift'}
mash = {'cmd', 'alt', 'ctrl'}
hyper = {'cmd', 'alt', 'ctrl', 'shift' }

-- :: misc
hs.hotkey.bind(mashShift, 'L', function()
  hs.caffeinate.startScreensaver()
end)
hs.hotkey.bind(ctrlAlt, 'r', function() hs.toggleConsole() end)
hs.hotkey.bind(cmdCtrl, "r", function()
  tearDownWatcherHandling()
  hs.reload()
  hs.notify.show('Hammerspoon', 'Config Reloaded', '')
end)

-- :: media
-- / uses (newly added) hs.eventtap.event.newSystemKeyEvent()
-- / https://github.com/Hammerspoon/hammerspoon/commit/a8ad4974777edc5b5db19176faf9dd2fe7b65c6f
--
-- insert key on ducky shine 3
hs.hotkey.bind('ctrl', 114, function() hs.eventtap.event.newSystemKeyEvent('PREVIOUS', true):post() end)
-- home key on ducky shine 3
hs.hotkey.bind('ctrl', 115, function() hs.eventtap.event.newSystemKeyEvent('PLAY', true):post() end)
-- pageup key on ducky shine 3
hs.hotkey.bind('ctrl', 116, function() hs.eventtap.event.newSystemKeyEvent('NEXT', true):post() end)

-- :: apps
hs.hotkey.bind(cmdCtrl, 'space', function() toggleApp('com.googlecode.iterm2') end)
hs.hotkey.bind('ctrl', 'space', function() toggleApp('com.googlecode.iterm2') end)
hs.hotkey.bind('cmd', '`', function() toggleApp('com.google.Chrome') end)
hs.hotkey.bind('cmd', 'f4', function() toggleApp('com.nylas.nylas-mail') end)
hs.hotkey.bind('cmd', 'f5', function() toggleApp('com.tapbots.TweetbotMac') end)
hs.hotkey.bind('cmd', 'f8', function() toggleApp('com.spotify.client') end)
hs.hotkey.bind(cmdShift, 'f8', function() toggleApp('google-play-music-desktop-player') end)
hs.hotkey.bind(mashShift, 'f8', function() toggleApp('com.sajidanwar.Radiant-Player') end)
hs.hotkey.bind(cmdShift, 'M', function() toggleApp('com.apple.iChat') end)

-- :: sub-app
-- / Chrome Dev Tools
hs.hotkey.bind('', 'F12', function ()
  local win = hs.window.focusedWindow()
  if win ~= nil and win:application():bundleID() == 'com.google.Chrome' then
    hs.eventtap.keyStroke(cmdAlt, "i")
  end
end)


-- window manipulation
-------------------------------------------------------------------------------

-- hs.hotkey.bind(cmdCtrl, 'h', utils.chain({
--   wm.config.grid.leftHalf,
--   wm.config.grid.leftThird,
--   wm.config.grid.leftTwoThirds,
--   }))

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

-- hs.hotkey.bind(cmdCtrl, 'l', utils.chain({
--   wm.config.grid.rightHalf,
--   wm.config.grid.rightThird,
--   wm.config.grid.rightTwoThirds,
--   }))

-- hs.hotkey.bind(ctrlAlt, 'k', utils.chain({
--   wm.config.grid.topHalf,
--   wm.config.grid.topThird,
--   wm.config.grid.topTwoThirds,
--   }))

-- hs.hotkey.bind(ctrlAlt, 'j', utils.chain({
--   wm.config.grid.topLeft,
--   wm.config.grid.topRight,
--   wm.config.grid.bottomRight,
--   wm.config.grid.bottomLeft,
--   }))

-- move windows between monitors
hs.hotkey.bind(mashShift, 'h', function()
  local win = hs.window.focusedWindow()
  local nextScreen = win:screen():previous()
  win:moveToScreen(nextScreen)
  end)
hs.hotkey.bind(mashShift, 'l', function()
  local win = hs.window.focusedWindow()
  local nextScreen = win:screen():next()
  win:moveToScreen(nextScreen)
  end)


-- create and initialize watchers
-------------------------------------------------------------------------------

applicationWatcher = hs.application.watcher.new(applicationHandler)
applicationWatcher:start()

screenWatcher = hs.screen.watcher.new(screenHandler)
screenWatcher:start()
screenHandler() -- must call this to have it do a thing initially

wifiWatcher = hs.wifi.watcher.new(wifiHandler)
wifiWatcher:start()

if (hostname == 'replibox') then
  usbWatcher = hs.usb.watcher.new(usbHandler)
  usbWatcher:start()

  caffeinateWatcher = hs.caffeinate.watcher.new(caffeinateHandler)
  caffeinateWatcher:start()
end
