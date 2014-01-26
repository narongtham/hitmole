describe("createDecoratorsFromConfig", function ( ... )

	decoratorConfigurations = {
		{
			filename = "decorators_1.png",
			x = 90,
			y = 320
		},
		{
			filename = "decorators_2.png",
			x = 666,
			y = 320
		}
	}

	local group

	local createDecorator = require "createDecorator"

	local createDecoratorsFromConfig = require "createDecoratorsFromConfig"

	setup(function ( ... )
		group = {}

		stub(createDecorator, "createAndInsertToGroup")
	end)

	teardown(function ( ... )
		createDecorator.createAndInsertToGroup:revert()
	end)

	it("Call createDecorator for each config item", function ( ... )
		-- when
		createDecoratorsFromConfig.create(group)
		--then
		assert.stub(createDecorator.createAndInsertToGroup).was_called_with(group, decoratorConfigurations[1])
		assert.stub(createDecorator.createAndInsertToGroup).was_called_with(group, decoratorConfigurations[2])
	end)
end)