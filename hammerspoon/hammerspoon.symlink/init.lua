-------------------------------------------------------------------------------
--/ initialize /--
-------------------------------------------------------------------------------

-- :: imports/requires
local wm = require 'wm'
local utils = require 'utils'
local config = require 'config'

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
configFileWatcher = nil

-- :: settings
require("hs.hotkey").setLogLevel("warning")


-- window filter subscriptions
-- :: watch relevant window events to do interesting things
----------------------------------------------------------------------------
allWindows = wf.new(nil, 'allWindows')
allWindows:subscribe(wf.windowCreated, function() handleCreated() end)
allWindows:subscribe(wf.windowFocused, function() handleFocused() end)
allWindows:subscribe(wf.windowMoved, function() handleMoved() end)
allWindows:subscribe(wf.windowUnfocused, function() handleUnfocused() end)
allWindows:subscribe(wf.windowOnScreen, function() handleOnScreen() end)
allWindows:subscribe(wf.windowNotOnScreen, function() handleNotOnScreen() end)


-- window filter eventhandlers
----------------------------------------------------------------------------

function handleCreated ()
  local win = hs.window.focusedWindow()
  if win ~= nil then
    utils.log.df('[wf] window created ("%s" for %s)', win:title(), win:application():bundleID())

    handleApplicationLayout(win, win:application())
    drawWindowBorder(win)
  end
end

function handleFocused ()
  local win = hs.window.focusedWindow()
  if win ~= nil then
    utils.log.df('[wf] window focused ("%s" for %s)', win:title(), win:application():bundleID())

    drawWindowBorder(win)
  end
end

function handleMoved ()
  local win = hs.window.focusedWindow()
  if win ~= nil then
    utils.log.df('[wf] window moved|resized|toggled ("%s" for %s)', win:title(), win:application():bundleID())

    drawWindowBorder(win)
  end
end

function handleUnfocused ()
  local win = hs.window.focusedWindow()
  if win ~= nil then
    utils.log.df('[wf] window unfocused ("%s" for %s on %s at %s)', win:title(), win:application():bundleID(), win:screen():name(), win:screen():position())

    windowBorder:delete()
  end
end

function handleOnScreen ()
  local win = hs.window.focusedWindow()
  if win ~= nil then
    utils.log.df('[wf] window on screen ("%s" for %s on %s at %s)', win:title(), win:application():bundleID(), win:screen():name(), win:screen():position())

    drawWindowBorder(win)
  end
end

function handleNotOnScreen ()
  local win = hs.window.focusedWindow()
  if win ~= nil then
    utils.log.df('[wf] window not on screen ("%s" for %s)', win:title(), win:application():bundleID())

    windowBorder:delete()
  end
end


-- window filter helpers
----------------------------------------------------------------------------


function handleApplicationLayout (win, app)
  utils.log.df('[wf] found %s valid windows for %s', utils.windowCount(app), app:name())

  if utils.canManageWindow(win) then
    local bundleID = app:bundleID()

    if config.layout[bundleID] then
      for _, window in pairs(utils.windowsForApp(app)) do
        if utils.canManageWindow(window) then
          utils.log.df('[app] applying layout for %s in %s', window:title(), app:name())
          config.layout[bundleID](window)
        end
      end
    -- else
    --   config.layout['default'](window)
    end
  end
end


function drawWindowBorder (win)
  -- clean up existing borders
  if windowBorder ~= nil then
    windowBorder:delete()
  end

  local ignoredWindows = utils.Set {'iTerm2', 'Electron Helper', 'TotalFinderCrashWatcher', 'CCXProcess', 'Adobe CEF Helper', 'Hammerspoon'}
  local win = (win ~= nil) and win or hs.window.focusedWindow()

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
  hs.notify.show('Hammerspoon', 'Config Reloaded', '')
  wm.events.tearDownEventHandling()
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
hs.hotkey.bind(cmdCtrl, 'space', function() utils.toggleApp('com.googlecode.iterm2') end)
hs.hotkey.bind('ctrl', 'space', function() utils.toggleApp('com.googlecode.iterm2') end)
hs.hotkey.bind('cmd', '`', function() utils.toggleApp('com.google.Chrome') end)
hs.hotkey.bind('cmd', 'f4', function() utils.toggleApp('com.nylas.nylas-mail') end)
hs.hotkey.bind('cmd', 'f5', function() utils.toggleApp('tweetbot') end)
hs.hotkey.bind('cmd', 'f8', function() utils.toggleApp('google-play-music-desktop-player') end)
hs.hotkey.bind(cmdShift, 'f8', function() utils.toggleApp('com.sajidanwar.Radiant-Player') end)
hs.hotkey.bind(cmdShift, 'M', function() utils.toggleApp('com.apple.iChat') end)

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

hs.hotkey.bind(cmdCtrl, 'l', utils.chain({
  wm.config.grid.rightHalf,
  wm.config.grid.rightThird,
  wm.config.grid.rightTwoThirds,
  }))

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

-- move windows between monitors
hs.hotkey.bind(ctrlAlt, 'h', function()
  local win = hs.window.focusedWindow()
  local nextScreen = win:screen():previous()
  win:moveToScreen(nextScreen)
  end)
hs.hotkey.bind(ctrlAlt, 'l', function()
  local win = hs.window.focusedWindow()
  local nextScreen = win:screen():next()
  win:moveToScreen(nextScreen)
  end)

-- activate multi-monitor layouts
hs.hotkey.bind(cmdCtrl, 'f1', (function()
  hs.notify.show('Window Management', 'Switching Layouts', 'Loaded Laptop Layout')
  wm.config.activateLayout(1)
  end))
hs.hotkey.bind(cmdCtrl, 'f2', (function()
  hs.notify.show('Window Management', 'Switching Layouts', 'Loaded Desktop Layout')
  wm.config.activateLayout(2)
  end))

-- ensure cli tools are installed
-------------------------------------------------------------------------------
-- hs.ipc.cliInstall()

print("++ Running: "..hs.processInfo.bundlePath)
print("++ Accessibility: "..tostring(hs.accessibilityState()))
