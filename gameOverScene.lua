local storyboard = storyboard or require("storyboard")  
local showGameOverBackgroundImage = require "showGameOverBackgroundImage"
local showEndingImage = require "showEndingImage"
local showPlayAgainButton = require "showPlayAgainButton"
local showMainMenuButton = require "showMainMenuButton"
local ads = require "ads"

local scene = storyboard.newScene()

function scene:createScene(e)
	local group = self.view

	showGameOverBackgroundImage.show(group)
	showEndingImage.show(group)
	showPlayAgainButton.show(group)
	showMainMenuButton.show(group, 840)
end

function scene:enterScene( ... )
	ads.show( "banner", { x = display.screenOriginX , y = display.screenOriginY + display.viewableContentHeight - 90 } )
end

function scene:exitScene( ... )
	ads.hide( )
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )

return scene