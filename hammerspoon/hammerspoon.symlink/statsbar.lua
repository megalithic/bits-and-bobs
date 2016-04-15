-------------------------------------------------------------------------------
--/ statsbar /--
-------------------------------------------------------------------------------

-- requires
-------------------------------------------------------------------------------
local hotkey  = require "hs.hotkey"
local alert   = require "hs.alert"
local draw    = require "hs.drawing"
local timer   = require "hs.timer"
local geom    = require "hs.geometry"
local screen  = require "hs.screen"

-- locals
-------------------------------------------------------------------------------
local rectify = geom.rect
local frame = screen:primaryScreen():fullFrame()
local statsbarSize = rectify(0,0,frame.w,25)
local currentWall = hs.execute('~/.dotfiles/bin/current-wall')
local statsbarBg = draw.image(statsbarSize, currentWall)
local statsbar = draw.rectangle(statsbarSize)

-- methods
-------------------------------------------------------------------------------
function init ()
  statsbar:setFillColor(draw.color.asRGB({ red=0.000,green=0.000,blue=0.000,alpha=1 }))
	statsbarBg:imageAlignment('top')
	statsbarBg:imageScaling('none')
	-- statsbarBg:setAlpha(0.5)
	statsbarBg:show()
  -- statsbar:show()
end

-- init()

-- function run_my_ls()
--   return hs.styledtext.ansi(hs.execute("ls"), {font={name="Monaco",size=10},backgroundColor={alpha=1}} )
-- end

-- function refresh_my_ls()
--   if my_ls then
--     my_ls:delete()
--   end
--   my_ls = hs.drawing.text(statsbar, run_my_ls())
--   my_ls:bringToFront()
--   my_ls:show()
-- end


-- my_ls = nil
-- refresh_my_ls()
-- timer_my_ls = hs.timer.new(5, refresh_my_ls, true):start()
