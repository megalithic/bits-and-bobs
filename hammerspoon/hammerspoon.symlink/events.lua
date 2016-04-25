-----------------------------------------------------------------------------------
--/ event handling /--
-----------------------------------------------------------------------------------
-- This will become a lot easier once `hs.window.filter`
-- (http://www.hammerspoon.org/docs/hs.window.filter.html) moves out of
-- "experimental" status, but until then, using a manual approach as
-- demonstrated at: https://gist.github.com/tmandry/a5b1ab6d6ea012c1e8c5

local globalWatcher = nil
local watchers = {}
local evt = {} -- to be returned/exported
local events = hs.uielement.watcher
local screenCount = #hs.screen.allScreens()
local wf = hs.window.filter
local windowBorder = nil

local config = require 'config'
local utils = require 'utils'

---------------------------------------------------------------------------- {{
-- SETUP WINDOW FILTER SUBSCRIPTIONS
-- :: watch relevant window events to do interesting things

allWindows = wf.new(nil, 'allWindows')
allWindows:subscribe(wf.windowCreated, function() redrawBorder() end)
allWindows:subscribe(wf.windowFocused, function() redrawBorder() end)
allWindows:subscribe(wf.windowMoved, function() redrawBorder() end)
allWindows:subscribe(wf.windowUnfocused, function() redrawBorder() end)
allWindows:subscribe(wf.windowOnScreen, function() redrawBorder() end)
allWindows:subscribe(wf.windowNotOnScreen, function() redrawBorder() end)

-- }}
--
--
function handleGlobalEvent(name, eventType, app)
  if eventType == hs.application.watcher.launched then
    utils.log.df('[event] launched %s', app:bundleID())
    watchApp(app)
  elseif eventType == hs.application.watcher.terminated then
    -- Only the PID is set for terminated apps, so can't log bundleID.
    local pid = app:pid()
    utils.log.df('[event] terminated PID %d', pid)
    unwatchApp(pid)
  end
end

function handleAppEvent(element, event)
  if event == events.windowCreated then
    if pcall(function()
      utils.log.df('[event] window %s created for %s', element:id(), element:application():bundleID())
    end) then
      watchWindow(element)
    else
      utils.log.wf('error thrown trying to access element in handleAppEvent')
    end
  else
    utils.log.wf('unexpected app event %d received', event)
  end
end

function handleWindowEvent(window, event, watcher, info)
  utils.log.df('[event] new window event (%s) for %s (%s)', event, window:application():bundleID(), info.id)

  if event == events.elementDestroyed then
    utils.log.df('[event] window %s destroyed for %s', info.id, window:application():bundleID())
    watcher:stop()
    watchers[info.pid].windows[info.id] = nil
  else
    utils.log.wf('unexpected window event %d received', event)
  end
end

function handleScreenEvent()
  -- Make sure that something noteworthy (display count) actually
  -- changed. We no longer check geometry because we were seeing spurious
  -- events.
  local screens = hs.screen.allScreens()
  if not (#screens == screenCount) then
    screenCount = #screens
    config.activateLayout(screenCount)
  end
end

function watchApp(app)
  local pid = app:pid()
  if watchers[pid] then
    utils.log.wf('[watchApp] attempted watch for already-watched PID %d', pid)
    return
  end

  -- Watch for new windows.
  local watcher = app:newWatcher(handleAppEvent)
  watchers[pid] = {
    watcher = watcher,
    windows = {},
  }
  watcher:start({events.windowCreated})

  -- Watch already-existing windows.
  for _, window in pairs(app:allWindows()) do
    watchWindow(window)
  end
end

function unwatchApp(pid)
  local appWatcher = watchers[pid]
  if not appWatcher then
    utils.log.wf('[unwatchApp] attempted unwatch for unknown PID %d', pid)
    return
  end

  appWatcher.watcher:stop()
  for _, watcher in pairs(appWatcher.windows) do
    watcher:stop()
  end
  watchers[pid] = nil
end

function watchWindow(window)
  local application = window:application()
  local bundleID = application:bundleID()
  local pid = application:pid()
  local windows = watchers[pid].windows
  if utils.canManageWindow(window) then
    -- Do initial layout-handling.
    local bundleID = application:bundleID()
    if config.layout[bundleID] then
      config.layout[bundleID](window)
    -- else
    --   config.layout['default'](window)
    end

    utils.log.df('[watchWindow] watching %s (id %s, %s windows)', bundleID, id, utils.windowCount(application))

    -- Watch for window-closed events.
    local id = window:id()

    if id then
      if not windows[id] then
        local watcher = window:newWatcher(handleWindowEvent, {
          id = id,
          pid = pid,
        })
        windows[id] = watcher
        watcher:start({events.elementDestroyed})
      end
    end
  end
end

---------------------------------------------------------------------------- {{
-- WINDOW FILTER EVENTS

function handleCreated ()
  local win = hs.window.focusedWindow()
  -- utils.log.df('[wm] window created ("%s" for %s)', win:title(), win:application():bundleID())
  redrawBorder()
end

function handleFocused ()
  local win = hs.window.focusedWindow()
  -- utils.log.df('[wm] window focused ("%s" for %s)', win:title(), win:application():bundleID())
  redrawBorder()
end

function handleMoved ()
  local win = hs.window.focusedWindow()
  -- Note: this includes moved, resized, and maximize/fullscreen toggled
  -- utils.log.df('[wm] window moved|resized|toggled ("%s" for %s)', win:title(), win:application():bundleID())
  redrawBorder()
end

function handleUnfocused ()
  -- local win = hs.window.focusedWindow()
  -- utils.log.df('[wm] window unfocused ("%s" for %s)', win:title(), win:application():bundleID())
  redrawBorder()
end

function handleOnScreen ()
  local win = hs.window.focusedWindow()
  -- utils.log.df('[wm] window onscreen ("%s" for %s)', win:title(), win:application():bundleID())
  redrawBorder()
end

function handleNotOnScreen ()
  -- utils.log.df('[wm] window onscreen ("%s" for %s)', win:title(), win:application():bundleID())
  redrawBorder()
end

function redrawBorder ()
  -- clean up existing borders
  if windowBorder ~= nil then
    windowBorder:delete()
  end

  local ignoredWindows = utils.Set {'iTerm2', 'Electron Helper', 'TotalFinderCrashWatcher', 'CCXProcess', 'Adobe CEF Helper'}
  local win = hs.window.focusedWindow()

  -- avoid drawing borders on "odd" windows, including iTerm2, Contexts, etc
  if win == nil or not utils.canManageWindow(win) or ignoredWindows[win:application():name()] then return end

  local topLeft = win:topLeft()
  local size = win:size()

  windowBorder = hs.drawing.rectangle(hs.geometry.rect( topLeft['x'], topLeft['y'], size['w'], size['h']))

  windowBorder:setStrokeColor({["red"]=.8,["blue"]=.1,["green"]=.1,["alpha"]=.4})
  windowBorder:setRoundedRectRadii(6.0, 6.0)
  windowBorder:setStrokeWidth(3)
  windowBorder:setStroke(true)
  windowBorder:setFill(false)
  windowBorder:setLevel("floating")
  windowBorder:show()
end

function initEventHandling()
  -- Watch for application-level events.
  globalWatcher = hs.application.watcher.new(handleGlobalEvent)
  globalWatcher:start()

  -- Watch already-running applications.
  local apps = hs.application.runningApplications()
  for _, app in pairs(apps) do
    if app:bundleID() ~= 'org.hammerspoon.Hammerspoon' then
      watchApp(app)
    end
  end

  -- Watch for screen changes.
  screenWatcher = hs.screen.watcher.new(handleScreenEvent)
  screenWatcher:start()
end

function evt.tearDownEventHandling()
  globalWatcher:stop()
  globalWatcher = nil

  screenWatcher:stop()
  screenWatcher = nil

  for pid, _ in pairs(watchers) do
    unwatchApp(pid)
  end
end

initEventHandling()

return evt
