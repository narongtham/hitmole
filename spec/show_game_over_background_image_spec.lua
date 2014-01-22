describe("showGameOverBackgroundImage", function ( ... )

	local showGameOverBackgroundImage = require "showGameOverBackgroundImage"
	
	local backGroundimage = {}
	
	display.newImage = function ( ... )
		return backGroundimage
	end

	group = {
		insert=function ( ... )
			-- body
		end
	}

	it("Show background of game over scene", function ( ... )
		--given
		spy.on(display, "newImage")
		--when
		showGameOverBackgroundImage.show(group)
		--then
		assert.spy(display.newImage).was_called_with("img/gameoverbg.png")
	end)

	it("Set background to center", function ( ... )
		-- given
		DISPLAY_CENTER_X = 100
		DISPLAY_CENTER_Y = 100
		
		--when
		showGameOverBackgroundImage.show(group)
		--then
		assert.are.equal(backGroundimage.x, DISPLAY_CENTER_X)
		assert.are.equal(backGroundimage.y, DISPLAY_CENTER_Y)
	end)

	it("Add background image to a given group", function ( ... )
		--given
		stub(group, "insert")
		--when
		showGameOverBackgroundImage.show(group)
		--then
		assert.stub(group.insert).was_called_with(group, backGroundimage)
	end)
end)