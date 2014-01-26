createDecorator = {}

function createDecorator.createAndInsertToGroup(group)
	local decoratorImage = display.newImage( "img/sprite/rubber_tube.png" )
	decoratorImage.x = 90
	decoratorImage.y = 320

	group:insert(decoratorImage)
end

return createDecorator