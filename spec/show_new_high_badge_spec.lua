describe("showNewHighBadge", function ( ... )
	local showNewHighBadge

	local newHighBadge = {}
	local group = {}
	local targetDisplayObject = {
		x=10,
		y=10,
		contentWidth=20,
		contentHeight=20 
	}

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
		showNewHighBadge.evaluate(group, targetDisplayObject)
		-- then
		assert.stub(display.newImage).was_called_with("img/sprite/new.png")
	end)

	it("Set x position", function ( ... )
		-- given
		local expected_x = 0
		-- when
		showNewHighBadge.evaluate(group, targetDisplayObject)
		-- then
		assert.are.equal(newHighBadge.x, expected_x)
	end)

	it("Set y position 686", function ( ... )
		-- given
		local expected_y = -12
		-- when
		showNewHighBadge.evaluate(group, targetDisplayObject)
		-- then
		assert.are.equal(newHighBadge.y, expected_y)
	end)

	it("Set rotation", function ( ... )
		-- when
		showNewHighBadge.evaluate(group, targetDisplayObject)
		-- then
		assert.are.equal(newHighBadge.rotation, -20)
	end)
end)