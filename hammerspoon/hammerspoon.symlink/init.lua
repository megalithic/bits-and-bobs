-- Reload hammerspoon configs
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config Reloaded")

-- Lock
hs.hotkey.bind({"cmd", "ctrl", "shift"}, 'L', function()
  -- open straight to the lock screen
  -- os.execute("open '/System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app'")
  -- open straight to the screensaver
  os.execute("open '/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'")
end)

-- require('aerosnap')
