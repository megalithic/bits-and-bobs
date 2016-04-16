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
local logLevel = 'debug' -- generally want 'debug' or 'info'
local log = hs.logger.new('replicant', logLevel)
local config = require 'config'

function handleGlobalEvent(name, eventType, app)
  if eventType == hs.application.watcher.launched then
    log.df('[event] launched %s', app:bundleID())
    watchApp(app)
  elseif eventType == hs.application.watcher.terminated then
    -- Only the PID is set for terminated apps, so can't log bundleID.
    local pid = app:pid()
    log.df('[event] terminated PID %d', pid)
    unwatchApp(pid)
  end
end

function handleAppEvent(element, event)
  if event == events.windowCreated then
    if pcall(function()
      log.df('[event] window %s created', element:id())
    end) then
      watchWindow(element)
    else
      log.wf('error thrown trying to access element in handleAppEvent')
    end
  else
    log.wf('unexpected app event %d received', event)
  end
end

function handleWindowEvent(window, event, watcher, info)
  if event == events.elementDestroyed then
    log.df('[event] window %s destroyed', info.id)
    watcher:stop()
    watchers[info.pid].windows[info.id] = nil
  else
    log.wf('unexpected window event %d received', event)
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
    log.wf('attempted watch for already-watched PID %d', pid)
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
    log.wf('attempted unwatch for unknown PID %d', pid)
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
  if config.canManageWindow(window) then
    -- Do initial layout-handling.
    local bundleID = application:bundleID()
    if config.layout[bundleID] then
      config.layout[bundleID](window)
    end

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

border = nil
function drawFocusedWindowBorder()
  if border then
    border:delete()
  end

  local win = hs.window.focusedWindow()
  if win == nil then return end

  local f = win:frame()
  local fx = f.x - 2
  local fy = f.y - 2
  local fw = f.w + 4
  local fh = f.h + 4

  border = hs.drawing.rectangle(hs.geometry.rect(fx, fy, fw, fh))
  border:setStrokeWidth(1)
  -- border:setStrokeColor({["red"]=0.75,["blue"]=0.14,["green"]=0.83,["alpha"]=0.80})
  border:setStrokeColor({["red"]=1,["blue"]=1,["green"]=1,["alpha"]=0.80})
  border:setRoundedRectRadii(5.0, 5.0)
  border:setStroke(true):setFill(false)
  border:setLevel("floating")
  border:show()
end

-- PRESENTLY DISABLED
-- drawFocusedWindowBorder()
-- windows = hs.window.filter.new(nil)
-- windows:subscribe(hs.window.filter.windowFocused, function () drawFocusedWindowBorder() end)
-- windows:subscribe(hs.window.filter.windowUnfocused, function () drawFocusedWindowBorder() end)
-- windows:subscribe(hs.window.filter.windowMoved, function () drawFocusedWindowBorder() end)


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
