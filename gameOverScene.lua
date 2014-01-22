local storyboard = storyboard or require("storyboard")  
local scene = storyboard.newScene()

function scene:createScene(e)
	local gameOverBackground = display.newImage("img/gameoverbg.png")
	gameOverBackground.x = DISPLAY_CENTER_X
	gameOverBackground.y = DISPLAY_CENTER_Y

	display.newImage( "img/end_image_1.png" )
end

scene:addEventListener( "createScene", scene )

return scene