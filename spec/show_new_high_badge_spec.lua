describe("showNewHighBadge", function ( ... )
	local showNewHighBadge

	local newHighBadge = {}
	local group = {}

	setup(function ( ... )
		
		display.newImage = function ( ... )
			return newHighBadge
		end
		spy.on(display, "newImage")

		stub(group, "insert")

		showNewHighBadge = require("showNewHighBadge")
	end)

	it("Create new high badge image", function ( ... )
		-- when
		showNewHighBadge.evaluate(group)
		-- then
		assert.stub(display.newImage).was_called_with("img/sprite/new.png")
	end)

	it("Set x position 164", function ( ... )
		-- when
		showNewHighBadge.evaluate(group)
		-- then
		assert.are.equal(newHighBadge.x, 164)
	end)

	it("Set y position 686", function ( ... )
		-- when
		showNewHighBadge.evaluate(group)
		-- then
		assert.are.equal(newHighBadge.y, 686)
	end)

	it("Set rotation", function ( ... )
		-- when
		showNewHighBadge.evaluate(group)
		-- then
		assert.are.equal(newHighBadge.rotation, 45)
	end)
end)