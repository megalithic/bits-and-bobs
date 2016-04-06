------------------------------------------------------------------------------------
--/ window management /--
------------------------------------------------------------------------------------

local cmdalt   = {"cmd", "alt"}
local ctrlalt   = {"ctrl", "alt"}
local mash = {"cmd", "alt", "ctrl"}
local hyper = {"cmd", "shift"}
local mashshift = {"cmd", "alt", "ctrl", "shift" }

hs.window.animationDuration = 0 -- disable animations
local logLevel = 'info' -- generally want 'debug' or 'info'
local log = hs.logger.new('replicant', logLevel)
local appwindow = nil
local frameCache = {}


-- https://github.com/wincent/wincent/blob/master/roles/dotfiles/files/.hammerspoon/init.lua
hs.grid.setGrid('12x12') -- allows us to place on quarters, thirds and halves

local screenCount = #hs.screen.allScreens()
local screenGeometries = hs.fnutils.map(hs.screen.allScreens(), function(screen)
  return screen:currentMode().desc
end)

local grid = {
  topHalf = '0,0 12x6',
  topThird = '0,0 12x4',
  topTwoThirds = '0,0 12x8',
  rightHalf = '6,0 6x12',
  rightThird = '8,0 4x12',
  rightTwoThirds = '4,0 8x12',
  bottomHalf = '0,6 12x6',
  bottomThird = '0,8 12x4',
  bottomTwoThirds = '0,4 12x8',
  leftHalf = '0,0 6x12',
  leftThird = '0,0 4x12',
  leftTwoThirds = '0,0 8x12',
  topLeft = '0,0 6x6',
  topRight = '6,0 6x6',
  bottomRight = '6,6 6x6',
  bottomLeft = '0,6 6x6',
  fullScreen = '0,0 12x12',
  centeredBig = '3,0 6x12',
  centeredSmall = '3,3 6x6',
}

local lastSeenChain = nil
local lastSeenWindow = nil

-- Chain the specified movement commands.
--
-- This is like the "chain" feature in Slate, but with a couple of enhancements:
--
--  - Chains always start on the screen the window is currently on.
--  - A chain will be reset after 2 seconds of inactivity, or on switching from
--    one chain to another, or on switching from one app to another, or from one
--    window to another.
--
function chain(movements)
  local chainResetInterval = 2 -- seconds
  local cycleLength = #movements
  local sequenceNumber = 1

  return function()
    if hs.window.focusedWindow()
    then
      local win = hs.window.frontmostWindow()
      local id = win:id()
      local now = hs.timer.secondsSinceEpoch()
      local screen = win:screen()

      if
        lastSeenChain ~= movements or
        lastSeenAt < now - chainResetInterval or
        lastSeenWindow ~= id
      then
        sequenceNumber = 1
        lastSeenChain = movements
      end
      lastSeenAt = now
      lastSeenWindow = id

      hs.grid.set(win, movements[sequenceNumber], screen)
      sequenceNumber = sequenceNumber % cycleLength + 1
    end
  end
end

hs.hotkey.bind(hyper, "k", chain({
  grid.fullScreen,
  grid.centeredBig,
  grid.centeredSmall,
}))

hs.hotkey.bind(hyper, "j", chain({
  grid.leftHalf,
  grid.leftTwoThirds,
  grid.leftThird,
}))

hs.hotkey.bind(hyper, "l", chain({
  grid.rightHalf,
  grid.rightTwoThirds,
  grid.rightThird,
}))

hs.hotkey.bind(hyper,"o", chain({
  grid.topRight,
}))

hs.hotkey.bind(hyper,".", chain({
  grid.bottomRight,
}))


hs.hotkey.bind(hyper,"u", chain({
  grid.topLeft,
}))

hs.hotkey.bind(hyper,"m", chain({
  grid.bottomLeft,
}))

-- throw screens around
function send_window_prev_monitor()
  hs.alert.show("Prev Monitor")
  local win = hs.window.focusedWindow()
  local nextScreen = win:screen():previous()
  win:moveToScreen(nextScreen)
end

function send_window_next_monitor()
  hs.alert.show("Next Monitor")
  local win = hs.window.focusedWindow()
  local nextScreen = win:screen():next()
  win:moveToScreen(nextScreen)
end

hs.hotkey.bind(hyper,"right", function()
  send_window_prev_monitor()
end)

hs.hotkey.bind(hyper,"left", function()
  send_window_next_monitor()
end)


-- lock the screen ala Windows NT
hs.hotkey.bind(hyper,"delete", function()
  hs.caffeinate.lockScreen()
  hs.alert.show("startScreensaver")
end)

--hs.hotkey.bind(hyper,"0", hideAll)
-- arrangeOmnifocus()

hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', hs.reload):start()

-- toggle window between normal size and max size
----------------------------------------------------------
function maximizeWindow()
  appwindow = hs.window.frontmostWindow()

  if frameCache[appwindow:id()] then
    appwindow:setFrame(frameCache[appwindow:id()])
    frameCache[appwindow:id()] = nil
  else
    frameCache[appwindow:id()] = appwindow:frame()
    appwindow:maximize()
    dim = appwindow:focusedWindow():frame()
    h = dim.h-5
    w = dim.w

    appwindow:setSize(w, h)
    appwindow:move({0, 25})
  end
end


hs.hotkey.bind(mash, "Up", maximizeWindow)
