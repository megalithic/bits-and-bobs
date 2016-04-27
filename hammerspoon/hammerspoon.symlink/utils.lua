local utils = {}

local logLevel = 'debug' -- generally want 'debug' or 'info'
local log = hs.logger.new('replicant', logLevel)
local lastSeenChain = nil
local lastSeenWindow = nil
utils.log = log

-- Chain the specified movement commands.
-- This is like the "chain" feature in Slate, but with a couple of enhancements:
--
--  - Chains always start on the screen the window is currently on.
--  - A chain will be reset after 2 seconds of inactivity, or on switching from
--    one chain to another, or on switching from one app to another, or from one
--    window to another.
--
utils.chain = function (movements)
  local chainResetInterval = 2 -- seconds
  local cycleLength = #movements
  local sequenceNumber = 1

  return function()
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
    elseif (sequenceNumber == 1) then
      -- At end of chain, restart chain on next screen.
      screen = screen:next()
    end
    lastSeenAt = now
    lastSeenWindow = id

    hs.grid.set(win, movements[sequenceNumber], screen)
    sequenceNumber = sequenceNumber % cycleLength + 1
  end
end

-- toggles application state
--
-- FIXME: this function is all sorts of wonky. come up with better.
utils.toggleApp = function (_app)
  -- accepts app name (lowercased), pid, or bundleID; but we ALWAYS use bundleID
  local app = hs.application.find(_app)

  if app ~= nil then
    utils.log.df('[apps] attempting to toggle %s', app:bundleID())
  end

  if not app then
    -- FIXME: this may not be working properly.. creating extraneous PIDs?
    utils.log.df('[apps] launchOrFocusByBundleID(%s) | not app 1', _app)
    hs.application.launchOrFocusByBundleID(_app)
  else
    local mainWin = app:mainWindow()
    if mainWin then
      if mainWin == hs.window.focusedWindow() then
        utils.log.df('[apps] hiding %s', app:bundleID())
        mainWin:application():hide()
      else
        utils.log.df('[apps] activating/unhiding/focusing %s', app:bundleID())
        mainWin:application():activate(true)
        mainWin:application():unhide()
        mainWin:focus()
      end
    else
      -- assumes there is no "mainWindow" for the application in question
      utils.log.df('[apps] launchOrFocusByBundleID(%s)', app)
      hs.application.launchOrFocusByBundleID(app:bundleID())
    end
  end
end

utils.windowsForApp = function (app)
  return app:allWindows()
end

-- Returns the number of standard, non-minimized windows in the application.
--
-- (For Chrome, which has two windows per visible window on screen, but only one
-- window per minimized window).
utils.windowCount = function (app)
  local count = 0
  if app then
    for _, window in pairs(utils.windowsForApp(app)) do
      -- ignores com.googlecode.iterm2
      if window:isStandard() and not window:isMinimized() then
        count = count + 1
      end
    end
  end
  return count
end

-- hides an application
--
utils.hide = function (bundleID)
  local app = hs.application.get(bundleID)
  if app then
    app:hide()
  end
end

-- activates/shows an application
--
utils.activate = function (bundleID)
  local app = hs.application.get(bundleID)
  if app then
    app:activate()
  end
end

-- determines if a window is manageable (takes into account iterm2)
--
utils.canManageWindow = function (window)
  local application = window:application()
  local bundleID = application:bundleID()

  -- Special handling for iTerm: windows without title bars are
  -- non-standard.
  return window:isStandard() or
    bundleID == 'com.googlecode.iterm2'
end

-- creates a set for easier traversal and searching
-- - takes an array as a table, e.g. Set {'foo', 'bar'}
utils.Set = function (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

utils.print = function(...)
  hs.rawprint(...)
  console.printStyledtext(...)
end

return utils
