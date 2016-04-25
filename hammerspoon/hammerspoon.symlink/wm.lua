-------------------------------------------------------------------------------
--/ window management /--
-------------------------------------------------------------------------------
-- A work in progress.. it's intended that using hs.window.filter will free me
-- from the sluggishness and overhead of the previous system used in events.lua.
--
-- We won't so much worry about watching apps, in as much as we care about windows.

-- :: locals
local wm = {}
local windowBorder = nil
local layouts = {}
local wf = hs.window.filter
local frameCache = {}

-- :: imports
local config = require 'config'
local utils = require 'utils'
-- local events = require 'events'

-- :: exports
wm.config = config
-- wm.events = events


---------------------------------------------------------------------------- {{
-- SETUP WINDOW FILTER SUBSCRIPTIONS
-- :: watch relevant window events to do interesting things

allWindows = wf.new(nil, 'allWindows')
allWindows:subscribe(wf.windowCreated, function() handleCreated() end)
allWindows:subscribe(wf.windowFocused, function() handleFocused() end)
allWindows:subscribe(wf.windowMoved, function() handleMoved() end)
allWindows:subscribe(wf.windowUnfocused, function() handleUnfocused() end)

-- }}


---------------------------------------------------------------------------- {{
-- GRID
-- :: to be moved to ./config.lua

wm.grid = {
  -- LEFT HALF (50%)
  leftHalf = function (win)
    local p = getWindowAndProps(win)

    p.f.x = p.max.x
    p.f.y = p.max.y
    p.f.w = p.max.w / 2
    p.f.h = p.max.h
    p.w:setFrame(p.f)

    redrawBorder()
  end,
  -- RIGHT HALF (50%)
  rightHalf = function (win)
    local p = getWindowAndProps(win)

    p.f.x = p.max.x + (p.max.w / 2)
    p.f.y = p.max.y
    p.f.w = p.max.w / 2
    p.f.h = p.max.h
    p.w:setFrame(p.f)

    redrawBorder()
  end,
  -- MAXIMIZE (fullscreen)
  maximize = function (win)
    local p = getWindowAndProps(win)

    p.f.x = p.max.x
    p.f.y = p.max.y
    p.f.w = p.max.w
    p.f.h = p.max.h
    p.w:setFrame(p.f)

    redrawBorder()
  end,
  -- CENTER
  center = function (win)
    local p = getWindowAndProps(win)

    p.f.x = p.max.w / 2 - p.f.w / 2 + p.max.x
    p.f.y = p.max.h / 2 - p.f.h / 2 + p.max.y
    p.f.w = p.max.w
    p.f.h = p.max.h
    p.w:setTopLeft(p.f)

    redrawBorder()
  end
}

-- }}


---------------------------------------------------------------------------- {{
-- WINDOW MANIPULATIONS

-- function wm.leftHalf()
--   local p = getWindowAndProps()

--   p.f.x = p.max.x
--   p.f.y = p.max.y
--   p.f.w = p.max.w / 2
--   p.f.h = p.max.h
--   p.w:setFrame(p.f)

--   redrawBorder()
-- end

-- function wm.rightHalf()
--   local p = getWindowAndProps()

--   p.f.x = p.max.x + (p.max.w / 2)
--   p.f.y = p.max.y
--   p.f.w = p.max.w / 2
--   p.f.h = p.max.h
--   p.w:setFrame(p.f)

--   redrawBorder()
-- end

-- function wm.maximize()
--   local p = getWindowAndProps()

--   p.f.x = p.max.x
--   p.f.y = p.max.y
--   p.f.w = p.max.w
--   p.f.h = p.max.h
--   p.w:setFrame(p.f)

--   redrawBorder()
-- end

function wm.center()
  local p = getWindowAndProps()

  p.f.x = p.max.w / 2 - p.f.w / 2 + p.max.x
  p.f.y = p.max.h / 2 - p.f.h / 2 + p.max.y
  p.f.w = p.max.w
  p.f.h = p.max.h
  p.w:setTopLeft(p.f)

  redrawBorder()
end

-- }}


---------------------------------------------------------------------------- {{
-- WINDOW FILTER EVENTS

function handleCreated ()
  local win = getFocusedWindow()
  utils.log.df('[wm] window created ("%s" for %s)', win:title(), win:application():bundleID())
  redrawBorder()
end

function handleFocused ()
  local win = getFocusedWindow()
  utils.log.df('[wm] window focused ("%s" for %s)', win:title(), win:application():bundleID())
  redrawBorder()
end

function handleMoved ()
  local win = getFocusedWindow()
  -- Note: this includes moved, resized, and maximize/fullscreen toggled
  utils.log.df('[wm] window moved|resized|toggled ("%s" for %s)', win:title(), win:application():bundleID())
  redrawBorder()
end

function handleUnfocused ()
  -- local win = getFocusedWindow()
  -- utils.log.df('[wm] window unfocused ("%s" for %s)', win:title(), win:application():bundleID())
  redrawBorder()
end

function redrawBorder()
  local ignoredWindows = utils.Set {'iTerm2', 'Electron Helper', 'TotalFinderCrashWatcher', 'CCXProcess', 'Adobe CEF Helper'}

  local win = getFocusedWindow()

  -- avoid drawing borders on "odd" windows, including iTerm2, Contexts, etc
  if win == nil or not utils.canManageWindow(win) or ignoredWindows[win:application():name()] then return end

  local topLeft = win:topLeft()
  local size = win:size()

  -- clean up existing borders
  if windowBorder ~= nil then
    windowBorder:delete()
  end

  windowBorder = hs.drawing.rectangle(hs.geometry.rect( topLeft['x'], topLeft['y'], size['w'], size['h']))

  windowBorder:setStrokeColor({["red"]=.8,["blue"]=.1,["green"]=.1,["alpha"]=.4})
  windowBorder:setRoundedRectRadii(6.0, 6.0)
  windowBorder:setStrokeWidth(3)
  windowBorder:setStroke(true)
  windowBorder:setFill(false)
  windowBorder:setLevel("floating")
  windowBorder:show()
end
-- redrawBorder()

-- }}


---------------------------------------------------------------------------- {{
-- HELPERS

-- Returns a table of a window + properties
--
-- @param: valid window object (optional)
-- @return: table of { w, f, s, max }
--
function getFocusedWindow ()
  return hs.window:focusedWindow()
end

-- Returns a table of a window + properties
--
-- @param: valid window object (optional)
-- @return: table of { w, f, s, max }
--
function getWindowAndProps (win)
  -- assign to the focused window if we weren't given one
  if win == nil then
    win = getFocusedWindow()
  end

  -- still need to bail if it's nail
  if win == nil then
    return
  end

  local props = {
    w = win,                   -- window
    f = win:frame(),           -- frame
    s =  win:screen(),          -- screen
    max = win:screen():frame() -- maxSize
  }

  return props
end

-- }}

return wm
