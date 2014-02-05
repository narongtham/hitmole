-- header
local storyboard = require "storyboard"  
local showMainMenuButton = require "showMainMenuButton"
local showBackToGameButton = require "showBackToGameButton"
local ads = require "ads" 
-- end header

local scene = storyboard.newScene()

function scene:createScene(e)
	local group = self.view

	local logo = display.newImage("img/bg_Menu.png")
	logo.x = DISPLAY_CENTER_X
	logo.y = DISPLAY_CENTER_Y
	logo.alpha = 1
	group:insert(logo)

	showBackToGameButton.show(group, DISPLAY_CENTER_Y)
	showMainMenuButton.show(group, DISPLAY_CENTER_Y + 100)
end

function scene:enterScene(e)
	ads.show( "banner", { x = display.screenOriginX , y = display.screenOriginY + display.viewableContentHeight - 90 } )
end

function  scene:exitScene(e)
	ads.hide( )
end

scene:addEventListener("createScene",scene)
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )

return scene