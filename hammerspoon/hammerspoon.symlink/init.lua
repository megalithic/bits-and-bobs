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


-- mashers
-- note: alt == opt
-------------------------------------------------------------------------------
cmdAlt = {'cmd', 'alt'}
cmdShift = {'cmd', 'shift'}
cmdCtrl = {'cmd', 'ctrl'}
ctrlAlt = {'ctrl', 'alt'}
hyper = {'cmd', 'ctrl', 'shift'}
mash = {'cmd', 'alt', 'ctrl'}
mashShift = {'cmd', 'alt', 'ctrl', 'shift' }


-- key bindings
-------------------------------------------------------------------------------

-- misc
--
hs.hotkey.bind({'cmd', 'ctrl', 'shift'}, 'L', function()
  hs.caffeinate.startScreensaver()
end)
hs.hotkey.bind(ctrlAlt, 'r', function() hs.toggleConsole() end)
hs.hotkey.bind(cmdCtrl, "r", function()
  hs.notify.show('Hammerspoon', 'Config Reloaded', '')
  -- wm.events.tearDownEventHandling()
  hs.reload()
end)

-- apps
--
hs.hotkey.bind(cmdCtrl, 'space', function() utils.toggleApp('com.googlecode.iterm2') end)
hs.hotkey.bind({'cmd'}, '`', function() utils.toggleApp('com.google.Chrome') end)
hs.hotkey.bind({'cmd'}, 'f4', function() utils.toggleApp('com.nylas.nylas-mail') end)
hs.hotkey.bind({'cmd'}, 'f5', function() utils.toggleApp('tweetbot') end)
hs.hotkey.bind({'cmd'}, 'f8', function() utils.toggleApp('google-play-music-desktop-player') end)
hs.hotkey.bind({'cmd', 'shift'}, 'M', function() utils.toggleApp('com.apple.iChat') end)
hs.hotkey.bind('', 'F12', function()
  local win = hs.window.focusedWindow()
  if win ~= nil and win:application():bundleID() == 'com.google.Chrome' then
    hs.eventtap.keyStroke({'cmd', 'alt'}, "i")
  end
end)

--
-- local wf=hs.window.filter
-- wf_brave = wf.new{'Brave'}
-- -- handle vim-like keybindings in brave
-- wf_brave:subscribe(wf.windowFocused, function()
--   hs.hotkey.bind({}, 'j', function()
--     hs.eventtap.keyStroke({}, "down")
--   end)
-- end)
-- wf_brave:unsubscribe(wf.windowUnfocused, function()
--   hs.hotkey:delete()
-- end)


-- window management
-------------------------------------------------------------------------------

hs.hotkey.bind(cmdCtrl, 'h', wm.grid.leftHalf)
hs.hotkey.bind(cmdCtrl, 'l', wm.grid.rightHalf)
hs.hotkey.bind(cmdCtrl, 'k', wm.grid.maximize)
hs.hotkey.bind(cmdCtrl, 'j', wm.grid.center)

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
hs.ipc.cliInstall()

-- setup auto-reloading of config (could be dangerous)
-------------------------------------------------------------------------------
function reloadConfig(files)
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
    hs.notify.show('Hammerspoon', 'Reload completed', '')
  end
end

configFileWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/init.lua", reloadConfig)
configFileWatcher:start()
