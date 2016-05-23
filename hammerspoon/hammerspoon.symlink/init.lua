-------------------------------------------------------------------------------
--/ initialize /--
-------------------------------------------------------------------------------

-- :: imports/requires
local utils = require 'utils'
local wm = require 'wm'
local hotkey = require 'hs.hotkey'
local redshift = require 'hs.redshift'
local settings   = require 'hs.settings'

-- :: settings
settings.clear('hs.redshift.inverted.override')
settings.clear('hs.redshift.disabled.override')

-- Ensure the IPC command line client is available
-- NOTE: this is failing with some hs and hs.1 type stuff
hs.ipc.cliInstall()

-- :: initialize all the things!
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

-- :: utility
hotkey.bind(ctrlAlt, 'r', function() hs.toggleConsole() end)
hotkey.bind(cmdCtrl, 'g', function() hs.grid.toggleShow() end)
hotkey.bind(mashShift, 'L', function()
  hs.caffeinate.startScreensaver()
end)
hotkey.bind(cmdCtrl, 'r', function()
  wm.events.tearDownEventHandling()
  hs.reload()
  hs.notify.show('Hammerspoon', 'Config Reloaded', '')
end)

-- :: media
hotkey.bind('ctrl', 114, function() utils.handleMediaKeyEvents('PREVIOUS', '⇤ previous') end) -- insert key
hotkey.bind('ctrl', 115, function() utils.handleMediaKeyEvents('PLAY', 'play/pause') end) -- home key
hotkey.bind('ctrl', 116, function() utils.handleMediaKeyEvents('NEXT', 'next ⇥') end) -- pageup key

-- :: apps
hotkey.bind(cmdCtrl, 'space', function() utils.toggleApp('com.googlecode.iterm2') end)
hotkey.bind('ctrl', 'space', function() utils.toggleApp('com.googlecode.iterm2') end)
hotkey.bind('cmd', '`', function() utils.toggleApp('com.google.Chrome') end)
hotkey.bind('cmd', 'f4', function() utils.toggleApp('com.nylas.nylas-mail') end)
hotkey.bind('cmd', 'f5', function() utils.toggleApp('com.tapbots.TweetbotMac') end)
hotkey.bind('cmd', 'f8', function() utils.toggleApp('com.spotify.client') end)
hotkey.bind(cmdShift, 'f8', function() utils.toggleApp('google-play-music-desktop-player') end)
hotkey.bind(mashShift, 'f8', function() utils.toggleApp('com.sajidanwar.Radiant-Player') end)
hotkey.bind(cmdShift, 'M', function() utils.toggleApp('com.apple.iChat') end)

-- :: sub-app
-- / Chrome Dev Tools
hotkey.bind('', 'F12', function ()
  local win = hs.window.focusedWindow()
  if win ~= nil and win:application():bundleID() == 'com.google.Chrome' then
    hs.eventtap.keyStroke(cmdAlt, "i")
  end
end)
-- / Tmux window selection via cmd + 1-9
for i = 1, 9 do
  hotkey.bind('cmd', ''..i..'', function ()
    local win = hs.window.focusedWindow()
    if win ~= nil and win:application():bundleID() == 'com.googlecode.iterm2' then
      hs.execute('tmux select-window -t '..i, true)
    end
  end)
end

-- :: redshift
hotkey.bind(cmdCtrl, 'F11', function()
  hs.notify.show('Hammerspoon', 'Redshift', 'Toggle Invert')
  redshift.toggleInvert()
end)

hotkey.bind(cmdCtrl, 'F12', function()
  hs.notify.show('Hammerspoon', 'Redshift', 'Toggle Redshift')
  redshift.toggle()
end)

-- :: window manipulation
hotkey.bind(cmdCtrl, 'h', utils.chain({
  wm.config.grid.leftHalf,
  wm.config.grid.leftOneThird,
  wm.config.grid.leftTwoThirds,
}))

hotkey.bind(cmdCtrl, 'k', utils.chain({
  wm.config.grid.fullScreen,
}))

hotkey.bind(cmdCtrl, 'l', utils.chain({
  wm.config.grid.rightHalf,
  wm.config.grid.rightOneThird,
  wm.config.grid.rightTwoThirds,
}))

hotkey.bind(cmdCtrl, 'j', utils.chain({
  wm.config.grid.centeredLarge,
  wm.config.grid.centeredMedium,
  wm.config.grid.centeredSmall,
}))

hotkey.bind(ctrlAlt, 'h', function()
  local win = hs.window.focusedWindow()
  local nextScreen = win:screen():previous()
  win:moveToScreen(nextScreen)
end)

hotkey.bind(ctrlAlt, 'l', function()
  local win = hs.window.focusedWindow()
  local nextScreen = win:screen():next()
  win:moveToScreen(nextScreen)
end)

-- :: monitor layout overrides
hotkey.bind(cmdCtrl, '1', (function()
  wm.config.applyLayout(1)
  hs.notify.show('Hammerspoon', 'Loading single-monitor layout', '')
end))

hotkey.bind(cmdCtrl, '2', (function()
  wm.config.applyLayout(2)
  hs.notify.show('Hammerspoon', 'Loading dual-monitor layout', '')
end))
