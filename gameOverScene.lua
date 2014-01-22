local storyboard = storyboard or require("storyboard")  
local showGameOverBackgroundImage = require "showGameOverBackgroundImage"

local scene = storyboard.newScene()

function scene:createScene(e)
	local group = self.view

	showGameOverBackgroundImage.show(group)

	display.newImage( "img/end_image_1.png" )
end

scene:addEventListener( "createScene", scene )

return scene