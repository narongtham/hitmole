describe("showEndingImage", function ( ... )

	local showEndingImage = require "showEndingImage"

	local endingImage
	local group

	setup(function ( ... )
		endingImage = {}
		display.newImage = function ( ... )
			return endingImage
		end

		group = {
			insert=function ( ... )
				-- body
			end
		}
	end)

	it("Show ending image", function ( ... )
		--given
		spy.on(display, "newImage")
		--when
		showEndingImage.show(group)
		--then
		assert.spy(display.newImage).was_called_with("img/end_image_1.png")
	end)

	it("Set image x position to center", function ( ... )
		-- given
		DISPLAY_CENTER_X = 100
		--when
		showEndingImage.show(group)
		--then
		assert.are.equal(endingImage.x, DISPLAY_CENTER_X)
	end)

	it("Set image y position to 300", function ( ... )
		-- given
		local expectedImageYPosition = 480
		--when
		showEndingImage.show(group)
		--then
		assert.are.equal(endingImage.y, expectedImageYPosition)
	end)

	it("Add background image to a given group", function ( ... )
		--given
		stub(group, "insert")
		--when
		showEndingImage.show(group)
		--then
		assert.stub(group.insert).was_called_with(group, endingImage)
	end)
end)