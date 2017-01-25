-------------------------------------------------------------------------------
--/ initialize /--
-------------------------------------------------------------------------------

-- :: imports/requires
-- require 'mpd'
-- require 'redshift'

local utils = require 'utils'
local wm = require 'wm'
local hotkey = require 'hs.hotkey'
local settings   = require 'hs.settings'
local ptt = require 'pushToTalk'

-- :: initialize all the things!
wm.events.initEventHandling()

-- key bindings
-------------------------------------------------------------------------------
cmdAlt = {'cmd', 'alt'}
cmdShift = {'cmd', 'shift'}
ctrlShift = {'ctrl', 'shift'}
cmdCtrl = {'cmd', 'ctrl'}
ctrlAlt = {'ctrl', 'alt'}
mashShift = {'cmd', 'ctrl', 'shift'}
mash = {'cmd', 'alt', 'ctrl'}
hyper = {'cmd', 'alt', 'ctrl', 'shift' }

-- :: utility
ptt.init({'cmd', 'alt'})
hotkey.bind(ctrlAlt, 'r', function() hs.toggleConsole() end)
hotkey.bind(mashShift, 'L', function()
  hs.caffeinate.startScreensaver()
end)
hotkey.bind(cmdCtrl, 'r', function()
  wm.events.tearDownEventHandling()
  hs.reload()
  hs.notify.show('Hammerspoon', 'Config Reloaded', '')
end)

-- :: media
hotkey.bind(ctrlShift, 27, function() utils.handleMediaKeyEvents('PREVIOUS', '⇤ previous') end) -- < - >
hotkey.bind(ctrlShift, '\\', function() utils.handleMediaKeyEvents('PLAY', 'play/pause') end)   -- < \ >
hotkey.bind(ctrlShift, 24, function() utils.handleMediaKeyEvents('NEXT', 'next ⇥') end)         -- < = >

-- :: apps
hotkey.bind(cmdCtrl, 'space', function() utils.toggleApp('com.googlecode.iterm2') end)
hotkey.bind('ctrl', 'space', function() utils.toggleApp('com.googlecode.iterm2') end)
hotkey.bind('ctrl', 'return', function() utils.toggleApp('org.mozilla.firefoxdeveloperedition') end)
hotkey.bind('cmd', '`', function() utils.toggleApp('com.google.Chrome') end)
hotkey.bind('cmdShift', '`', function() utils.toggleApp('org.mozilla.firefoxdeveloperedition') end)
hotkey.bind('cmd', 'f4', function() utils.toggleApp('com.readdle.smartemail-Mac') end)
hotkey.bind('mashShift', 'f4', function() utils.toggleApp('it.bloop.airmail2') end)
hotkey.bind('cmdShift', 'f4', function() utils.toggleApp('com.postbox-inc.postbox') end)
hotkey.bind('cmd', 'f5', function() utils.toggleApp('com.tapbots.TweetbotMac') end)
hotkey.bind('cmd', 'f6', function() utils.toggleApp('com.tinyspeck.slackmacgap') end)
hotkey.bind('cmd', 'f8', function() utils.toggleApp('com.spotify.client') end)
hotkey.bind(cmdShift, '8', function() utils.toggleApp('com.spotify.client') end)
hotkey.bind(cmdCtrl, '8', function() utils.toggleApp('com.spotify.client') end)
hotkey.bind(cmdShift, 'f8', function() utils.toggleApp('google-play-music-desktop-player') end)
hotkey.bind(mashShift, 'f8', function() utils.toggleApp('com.sajidanwar.Radiant-Player') end)
hotkey.bind(cmdShift, 'M', function() utils.toggleApp('com.apple.iChat') end)

-- :: sub-app
-- / Chrome Dev Tools
-- hotkey.bind('', 'F12', function ()
--   local win = hs.window.focusedWindow()
--   if win ~= nil and win:application():bundleID() == 'com.google.Chrome' then
--     hs.eventtap.keyStroke(cmdAlt, "i")
--   end
-- end)
-- / Tmux window selection via cmd + 1-9
-- for i = 1, 9 do
--   hotkey.bind('cmd', ''..i..'', function ()
--     local win = hs.window.focusedWindow()
--     if win ~= nil and win:application():bundleID() == 'com.googlecode.iterm2' then
--       hs.execute('tmux select-window -t '..i, true)
--     end
--   end)
-- end

-- :: toggle input device muting (similar to Shush.app, but not push-to-talk)
-- hotkey.bind('', 'f1', nil, nil, function ()
--   local input = hs.audiodevice.defaultInputDevice()
--   if input:muted() then
--     input:setMuted(false)
--     input:setInputVolume(50)
--   else
--     input:setMuted(true)
--     input:setInputVolume(0)
--   end
-- end)


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
