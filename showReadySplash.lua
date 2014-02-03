showReadySplash = {}

function showReadySplash.evaluate(group)
	local splashImage = display.newImage( "img/sprite/ready/go.png" )
	splashImage.x = DISPLAY_CENTER_X
	splashImage.y = DISPLAY_CENTER_Y
	group:insert(splashImage)
end

return showReadySplash