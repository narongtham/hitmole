describe("createDecorator", function ( ... )

	local createDecorator = require "createDecorator"

	local decoratorImage
	local group

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
		createDecorator.createAndInsertToGroup(group)
		-- then
		assert.spy(display.newImage).was_called_with("img/sprite/rubber_tube.png")
	end)

	it("Set x position to 90", function ( ... )
		-- given
		local expected_x = 90
		-- when
		createDecorator.createAndInsertToGroup(group)
		--then
		assert.are.equal(decoratorImage.x, expected_x)
	end)

	it("Set y position to 320", function ( ... )
		-- given
		local expected_y = 320
		-- when
		createDecorator.createAndInsertToGroup(group)
		--then
		assert.are.equal(decoratorImage.y, expected_y)
	end)

	it("Add decorator to assigned group", function ( ... )
		--when
		createDecorator.createAndInsertToGroup(group)
		--then
		assert.stub(group.insert).was_called_with(group, decoratorImage)
	end)
end)