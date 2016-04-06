-----------------------------------------------------------------------------------
--/ initialize /--
-----------------------------------------------------------------------------------
local basePath = os.getenv('HOME') .. '/.hammerspoon/'
local imagePath = basePath .. 'assets/'


-- require 'events'
require 'windows'
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

-- auto-reload configurations
----------------------------------------------------------
-- function reloadConfig(files)
--   for _, file in pairs(files) do
--     if file:sub(-4) == '.lua' then
--       hs.alert.show("Config Reloaded")
--       -- hs.notify.new({title="Hammerspoon", informativeText="Config reloaded"}):send()
--       hs.reload()
--     end
--   end
-- end

-- hs.hotkey.bind({"cmd", "ctrl", "shift"}, "R",  reloadConfig)
-- hs.pathwatcher.new(basePath, reloadConfig):start()
