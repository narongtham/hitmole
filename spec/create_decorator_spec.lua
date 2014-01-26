describe("createDecorator", function ( ... )

	local createDecorator = require "createDecorator"

	local decoratorImage
	local group
	local decoratorConfig = {
		filename = "decorators_1.png",
		x = 90,
		y = 320
	}

	setup(function ( ... )
		group = {}
		stub(group, "insert")

		decoratorImage = {}

		display.newImage = function ( ... )
			return decoratorImage
		end
	end)

	it("Create new decorator image", function ( ... )
		-- given
		spy.on(display, "newImage")
		-- when
		createDecorator.createAndInsertToGroup(group, decoratorConfig)
		-- then
		assert.spy(display.newImage).was_called_with(decoratorConfig.filename)
	end)

	it("Set x position to 90", function ( ... )
		-- when
		createDecorator.createAndInsertToGroup(group, decoratorConfig)
		--then
		assert.are.equal(decoratorImage.x, decoratorConfig.x)
	end)

	it("Set y position to 320", function ( ... )
		-- given
		local expected_y = 320
		-- when
		createDecorator.createAndInsertToGroup(group, decoratorConfig)
		--then
		assert.are.equal(decoratorImage.y, decoratorConfig.y)
	end)

	it("Add decorator to assigned group", function ( ... )
		--when
		createDecorator.createAndInsertToGroup(group, decoratorConfig)
		--then
		assert.stub(group.insert).was_called_with(group, decoratorImage)
	end)
end)