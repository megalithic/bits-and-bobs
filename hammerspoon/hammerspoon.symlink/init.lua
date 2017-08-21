-------------------------------------------------------------------------------
--/ initialize /--
-------------------------------------------------------------------------------

-- :: imports/requires
-- require 'mpd'
-- require 'redshift'
require('control-escape')
-- require('delete-words')
-- require('hyper')
-- require('markdown')
-- require('microphone')
-- require('panes')
-- require('super')
-- require('windows')

local utils = require 'utils'
local wm = require 'wm'
local hotkey = require 'hs.hotkey'
local settings   = require 'hs.settings'
-- local ptt = require 'pushToTalk'

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
-- ptt.init({'cmd', 'alt'})
hotkey.bind(ctrlAlt, 'r', function() hs.toggleConsole() end)
hotkey.bind(mashShift, 'L', function()
  hs.caffeinate.startScreensaver()
end)
hotkey.bind(cmdCtrl, 'r', function()
  wm.events.tearDownEventHandling()
  hs.reload()
  hs.notify.show('Hammerspoon', 'Config Reloaded', '')
end)

keyUpDown = function(modifiers, key)
  -- Un-comment & reload config to log each keystroke that we're triggering
  -- log.d('Sending keystroke:', hs.inspect(modifiers), key)
  hs.eventtap.keyStroke(modifiers, key, 0)
end

-- :: media
hotkey.bind(ctrlShift, 27, function() utils.handleMediaKeyEvents('PREVIOUS', '⇤ previous') end) -- < - >
hotkey.bind(ctrlShift, '\\', function() utils.handleMediaKeyEvents('PLAY', 'play/pause') end)   -- < \ >
hotkey.bind(ctrlShift, 24, function() utils.handleMediaKeyEvents('NEXT', 'next ⇥') end)         -- < = >

-- :: apps
hotkey.bind(cmdCtrl, 'space', function() utils.toggleApp('com.googlecode.iterm2') end)
hotkey.bind('ctrl', 'space', function() utils.toggleApp('com.googlecode.iterm2') end)
hotkey.bind('ctrl', 'return', function() utils.toggleApp('com.google.Chrome') end)
hotkey.bind('cmd', '`', function() utils.toggleApp('com.google.Chrome') end)
hotkey.bind('cmd', 'f4', function() utils.toggleApp('com.readdle.smartemail-Mac') end)
hotkey.bind('cmd', 'f5', function() utils.toggleApp('com.tapbots.TweetbotMac') end)
hotkey.bind('cmd', 'f6', function() utils.toggleApp('com.tinyspeck.slackmacgap') end)
hotkey.bind('cmd', 'f8', function() utils.toggleApp('com.spotify.client') end)
hotkey.bind(cmdShift, '8', function() utils.toggleApp('com.spotify.client') end)
hotkey.bind(cmdCtrl, '8', function() utils.toggleApp('com.spotify.client') end)
hotkey.bind(cmdShift, 'f8', function() utils.toggleApp('google-play-music-desktop-player') end)
hotkey.bind(mashShift, 'f8', function() utils.toggleApp('com.sajidanwar.Radiant-Player') end)
hotkey.bind(cmdShift, 'M', function() utils.toggleApp('com.apple.iChat') end)

-- hotkey.bind({'ctrl'}, 'delete', nil, function() hs.eventtap.keyStroke({}, 'forwarddelete') end, nil, function() hs.eventtap.keyStroke({}, 'forwarddelete') end)

-- Catch fn-h and convert it to a left arrow key.
-- function fnKeyCatcher(event)
--   local mappings_tbl = {
--     ['h'] = 'left',
--     ['j'] = 'down',
--     ['k'] = 'up',
--     ['l'] = 'right'
--   }

-- ////////////////////////////////////////
-- TODO:
-- need to map the above table into a way to fir the correct eventtap event
-- ////////////////////////////////////////

--   local func = c_tbl[choice]
--   if(func) then
--     func()
--   else
--     print " The program has been terminated."
--     print " Thank you!";
--   end

--   if event:getFlags()['fn'] and event:getCharacters() == "h" then
--     print("fn-h!")
--     return true, {hs.eventtap.event.newKeyEvent({}, "left", true)}
--   end
--   return false
-- end

-- local keyMapper = hs.eventtap.new({hs.eventtap.event.types.keyDown}, fnKeyCatcher):start()

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
