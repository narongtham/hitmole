-- header
local storyboard = require "storyboard"  
local showMainMenuButton = require "showMainMenuButton"
local showBackToGameButton = require "showBackToGameButton"
-- end header

local scene = storyboard.newScene()

function scene:createScene(e)
	local group = self.view

	local logo = display.newImage("img/bg_Menu.png")
	logo.x = DISPLAY_CENTER_X
	logo.y = DISPLAY_CENTER_Y
	logo.alpha = 1
	group:insert(logo)

	showMainMenuButton.show(group, DISPLAY_CENTER_Y)
	showBackToGameButton.show(group, DISPLAY_CENTER_Y + 100)
end

scene:addEventListener("createScene",scene)

return scene