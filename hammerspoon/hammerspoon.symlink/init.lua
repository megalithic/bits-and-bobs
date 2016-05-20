-------------------------------------------------------------------------------
--/ initialize /--
-------------------------------------------------------------------------------

-- :: imports/requires
local utils = require 'utils'
local wm = require 'wm'

-- Ensure the IPC command line client is available
hs.ipc.cliInstall()

-- Initialize all the things!
wm.events.initEventHandling()


-- key bindings
-------------------------------------------------------------------------------
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
hs.hotkey.bind(cmdCtrl, 'r', function()
  wm.events.tearDownEventHandling()
  hs.reload()
  hs.notify.show('Hammerspoon', 'Config Reloaded', '')
end)
hs.hotkey.bind(cmdCtrl, 'g', function() hs.grid.toggleShow() end)

-- :: media
hs.hotkey.bind('ctrl', 114, function() hs.eventtap.event.newSystemKeyEvent('PREVIOUS', true):post() hs.alert.show('⇤ previous') end) -- insert key
hs.hotkey.bind('ctrl', 115, function() hs.eventtap.event.newSystemKeyEvent('PLAY', true):post() hs.alert.show('play/pause') end) -- home key
hs.hotkey.bind('ctrl', 116, function() hs.eventtap.event.newSystemKeyEvent('NEXT', true):post() hs.alert.show('next ⇥') end) -- pageup key

-- :: apps
hs.hotkey.bind(cmdCtrl, 'space', function() utils.toggleApp('com.googlecode.iterm2') end)
hs.hotkey.bind('ctrl', 'space', function() utils.toggleApp('com.googlecode.iterm2') end)
hs.hotkey.bind('cmd', '`', function() utils.toggleApp('com.google.Chrome') end)
hs.hotkey.bind('cmd', 'f4', function() utils.toggleApp('com.nylas.nylas-mail') end)
hs.hotkey.bind('cmd', 'f5', function() utils.toggleApp('com.tapbots.TweetbotMac') end)
hs.hotkey.bind('cmd', 'f8', function() utils.toggleApp('com.spotify.client') end)
hs.hotkey.bind(cmdShift, 'f8', function() utils.toggleApp('google-play-music-desktop-player') end)
hs.hotkey.bind(mashShift, 'f8', function() utils.toggleApp('com.sajidanwar.Radiant-Player') end)
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
  wm.config.grid.leftOneThird,
  wm.config.grid.leftTwoThirds,
  }))

hs.hotkey.bind(cmdCtrl, 'k', utils.chain({
  wm.config.grid.fullScreen,
  }))

hs.hotkey.bind(cmdCtrl, 'l', utils.chain({
  wm.config.grid.rightHalf,
  wm.config.grid.rightOneThird,
  wm.config.grid.rightTwoThirds,
  }))

hs.hotkey.bind(cmdCtrl, 'j', utils.chain({
  wm.config.grid.centeredLarge,
  wm.config.grid.centeredMedium,
  wm.config.grid.centeredSmall,
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

-- forcefully load a single or two monitor layout
hs.hotkey.bind(cmdCtrl, '1', (function()
  hs.notify.show('Hammerspoon', 'Loading single-monitor layout', '')
  wm.config.applyLayout(1)
  end))

hs.hotkey.bind(cmdCtrl, '2', (function()
  hs.notify.show('Hammerspoon', 'Loading dual-monitor layout', '')
  wm.config.applyLayout(2)
  end))
