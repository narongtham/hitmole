describe("showReadySplash", function ( ... )
	local showReadySplash

	local endingImage
	local group

	setup(function ( ... )
		endingImage = {}
		display.newImage = function ( ... )
			return endingImage
		end
		
		group = {
			insert=function ( ... )
			end
		}

		showReadySplash = require("showReadySplash")
	end)

	it("Show ready image", function ( ... )
		--given
		spy.on(display, "newImage")
		--when
		showReadySplash.evaluate(group)
		--then
		assert.spy(display.newImage).was_called_with("img/sprite/ready/go.png")
	end)

	it("Set image x position to center", function ( ... )
		-- given
		DISPLAY_CENTER_X = 100
		--when
		showEndingImage.show(group)
		--then
		assert.are.equal(endingImage.x, DISPLAY_CENTER_X)
	end)

	it("Set image y position to center", function ( ... )
		-- given
		DISPLAY_CENTER_Y = 120
		--when
		showReadySplash.evaluate(group)
		--then
		assert.are.equal(endingImage.y, DISPLAY_CENTER_Y)
	end)

	it("Add background image to a given group", function ( ... )
		--given
		stub(group, "insert")
		--when
		showReadySplash.evaluate(group)
		--then
		assert.stub(group.insert).was_called_with(group, endingImage)
	end)

	it("Evaluate startSplashScreenTimer")
end)