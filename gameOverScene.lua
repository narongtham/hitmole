local storyboard = storyboard or require("storyboard")  
local showGameOverBackgroundImage = require "showGameOverBackgroundImage"
local showEndingImage = require "showEndingImage"
local showPlayAgainButton = require "showPlayAgainButton"

local scene = storyboard.newScene()

function scene:createScene(e)
	local group = self.view

	showGameOverBackgroundImage.show(group)
	showEndingImage.show(group)
	showPlayAgainButton.show(group)
end

scene:addEventListener( "createScene", scene )

return scene