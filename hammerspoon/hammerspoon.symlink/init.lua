-----------------------------------------------------------------------------------
--/ initialize /--
-----------------------------------------------------------------------------------
local basePath = os.getenv("HOME") .. "/.hammerspoon/"
local imagePath = basePath .. 'assets/';


-- require 'battery'
-- require 'windows'
-- require 'random'
-- require('aerosnap')


-- reload configurations
----------------------------------------------------------
function reloadConfig()
  hs.alert.show("Config Reloaded")
  hs.reload()
end

hs.hotkey.bind({"cmd", "ctrl", "shift"}, "R",  reloadConfig)
hs.pathwatcher.new(basePath, reloadConfig):start()

-- lock laptop
----------------------------------------------------------
function lockComputer()
  -- open straight to the lock screen
  os.execute("open '/System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app'")
  -- open straight to the screensaver
  -- os.execute("open '/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'")
end
hs.hotkey.bind({"cmd", "ctrl", "shift"}, 'L', lockComputer)
