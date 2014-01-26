createDecorator = {}

function createDecorator.createAndInsertToGroup(group, decoratorConfig)
	local decoratorImage = display.newImage( decoratorConfig.filename )
	decoratorImage.x = decoratorConfig.x
	decoratorImage.y = decoratorConfig.y

	group:insert(decoratorImage)
end

return createDecorator