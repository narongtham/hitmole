local createDecorator = createDecorator or require "createDecorator"
local decoratorConfigurations = decoratorConfigurations or require "decoratorConfigurations"

createDecoratorsFromConfig = {}

function createDecoratorsFromConfig.create(group)
	for i=1, #decoratorConfigurations do
		createDecorator.createAndInsertToGroup(group, decoratorConfigurations[i])
	end
end

return createDecoratorsFromConfig