-----------------------------------------------------------------------------------
--/ apps (launching and other stuffs) /--
-----------------------------------------------------------------------------------

function toggle_application(_app)
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

hs.hotkey.bind({'cmd'}, '`', function() toggle_application("Google Chrome") end)
hs.hotkey.bind({'cmd', 'shift'}, '`', function() toggle_application("Safari") end)
hs.hotkey.bind({'cmd'}, 'f4', function() toggle_application("Nylas N1") end)
hs.hotkey.bind({'cmd'}, 'f5', function() toggle_application("Tweetbot") end)
hs.hotkey.bind({'cmd'}, 'f8', function() toggle_application("Google Play Music Desktop Player") end)
hs.hotkey.bind({'cmd', 'shift'}, 'M', function() toggle_application("Messages") end)
-- hs.hotkey.bind({'ctrl'}, '', nil, nil, nil, function() toggle_application("iTerm2") end)
