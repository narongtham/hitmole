local createDecorator = createDecorator or require "createDecorator"
local decoratorConfigurations = decoratorConfigurations or require "decoratorConfigurations"

createDecoratorsFromConfig = {}

function createDecoratorsFromConfig.create(group)
	createDecorator.createAndInsertToGroup(group, decoratorConfigurations[1])
	createDecorator.createAndInsertToGroup(group, decoratorConfigurations[2])
end

return createDecoratorsFromConfig