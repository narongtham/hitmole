showGameOverBackgroundImage = {}

function showGameOverBackgroundImage.show(group)
	local backgroundImage = display.newImage( "img/gameoverbg.png")
	backgroundImage.x = DISPLAY_CENTER_X
	backgroundImage.y = DISPLAY_CENTER_Y
	group:insert(backgroundImage)
end

return showGameOverBackgroundImage