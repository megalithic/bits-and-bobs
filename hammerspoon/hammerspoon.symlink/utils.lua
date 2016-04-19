local utils = {}

-- Chain the specified movement commands.
-- This is like the "chain" feature in Slate, but with a couple of enhancements:
--
--  - Chains always start on the screen the window is currently on.
--  - A chain will be reset after 2 seconds of inactivity, or on switching from
--    one chain to another, or on switching from one app to another, or from one
--    window to another.
--
local lastSeenChain = nil
local lastSeenWindow = nil
function utils.chain(movements)
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
function utils.toggle_application(_app)
  local app = hs.appfinder.appFromName(_app)
  if not app then
    -- FIXME: this may not be working properly.. creating extraneous PIDs?
    hs.application.launchOrFocus(_app)
    return
  end
  local mainwin = app:mainWindow()
  if mainwin then
    if mainwin == hs.window.focusedWindow() then
      mainwin:application():hide()
    else
      mainwin:application():activate(true)
      mainwin:application():unhide()
      mainwin:focus()
    end
  end
end

function utils.windowsForApp(app)
  return app:allWindows()
end

-- Returns the number of standard, non-minimized windows in the application.
--
-- (For Chrome, which has two windows per visible window on screen, but only one
-- window per minimized window).
function utils.windowCount(app)
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
function utils.hide(bundleID)
  local app = hs.application.get(bundleID)
  if app then
    app:hide()
  end
end

-- activates/shows an application
--
function utils.activate(bundleID)
  local app = hs.application.get(bundleID)
  if app then
    app:activate()
  end
end

-- determines if a window is manageable (takes into account iterm2)
--
function utils.canManageWindow(window)
  local application = window:application()
  local bundleID = application:bundleID()

  -- Special handling for iTerm: windows without title bars are
  -- non-standard.
  return window:isStandard() or
    bundleID == 'com.googlecode.iterm2'
end

return utils
