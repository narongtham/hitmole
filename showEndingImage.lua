showEndingImage = {}

function showEndingImage.show(group)
	local endingImage = display.newImage("img/end_image_1.png")
	endingImage.x = DISPLAY_CENTER_X
	endingImage.y = 480

	group:insert(endingImage)
end

return showEndingImage