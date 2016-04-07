-----------------------------------------------------------------------------------
--/ initialize /--
-----------------------------------------------------------------------------------
local basePath = os.getenv('HOME') .. '/.hammerspoon/'
local imagePath = basePath .. 'assets/'


require 'windows'
require 'apps'
-- require 'events'
-- require 'battery'
-- require 'random'


-- lock laptop
----------------------------------------------------------
function lockComputer()
  -- open straight to the lock screen
  os.execute("open '/System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app'")

  -- open straight to the screensaver
  -- os.execute("open '/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'")

  -- actually logout
  -- hs.caffeinate.lockScreen()
end
hs.hotkey.bind({"cmd", "ctrl", "shift"}, 'L', lockComputer)
