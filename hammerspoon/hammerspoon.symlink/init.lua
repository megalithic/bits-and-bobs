-------------------------------------------------------------------------------
--/ initialize /--
-------------------------------------------------------------------------------

-- :: locals
local wm = require 'wm'
local utils = require 'utils'

-- :: globals
basePath = os.getenv('HOME') .. '/.hammerspoon/'
imagePath = basePath .. 'assets/'
configFileWatcher = nil

-- :: settings
require("hs.hotkey").setLogLevel("warning")


-- mashers
-- note: alt == opt
-------------------------------------------------------------------------------
cmdAlt = {'cmd', 'alt'}
cmdShift = {'cmd', 'shift'}
cmdCtrl = {'cmd', 'ctrl'}
ctrlAlt = {'ctrl', 'alt'}
mashShift = {'cmd', 'ctrl', 'shift'}
mash = {'cmd', 'alt', 'ctrl'}
hyper = {'cmd', 'alt', 'ctrl', 'shift' }


-- key bindings
-------------------------------------------------------------------------------

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
hs.hotkey.bind('ctrl', 'space', function() utils.toggleApp('com.googlecode.iterm2') end)
hs.hotkey.bind('cmd', '`', function() utils.toggleApp('com.google.Chrome') end)
hs.hotkey.bind('cmd', 'f4', function() utils.toggleApp('com.nylas.nylas-mail') end)
hs.hotkey.bind('cmd', 'f5', function() utils.toggleApp('tweetbot') end)
hs.hotkey.bind('cmd', 'f8', function() utils.toggleApp('google-play-music-desktop-player') end)
hs.hotkey.bind(cmdShift, 'f8', function() utils.toggleApp('com.sajidanwar.Radiant-Player') end)
hs.hotkey.bind('cmd', 'shift', 'M', function() utils.toggleApp('com.apple.iChat') end)

-- https://github.com/cmsj/hammerspoon-config/blob/master/init.lua#L616
hs.hotkey.bind(cmdCtrl, 'n', function() hs.task.new("/usr/bin/open", nil, {os.getenv("HOME")}):start() end)

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
