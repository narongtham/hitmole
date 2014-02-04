describe("showReadySplash", function ( ... )
	local showReadySplash

	local splashImage
	local group

	setup(function ( ... )
		splashImage = {}
		display.newImage = function ( ... )
			return splashImage
		end
		
		group = {
			insert=function ( ... )
			end
		}

		startReadySplashTimer = {}
		stub(startReadySplashTimer, "evaluate")

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
		showReadySplash.evaluate(group)
		--then
		assert.are.equal(splashImage.x, DISPLAY_CENTER_X)
	end)

	it("Set image y position to center", function ( ... )
		-- given
		DISPLAY_CENTER_Y = 120
		--when
		showReadySplash.evaluate(group)
		--then
		assert.are.equal(splashImage.y, DISPLAY_CENTER_Y)
	end)

	it("Add background image to a given group", function ( ... )
		--given
		stub(group, "insert")
		--when
		showReadySplash.evaluate(group)
		--then
		assert.stub(group.insert).was_called_with(group, splashImage)
	end)

	it("Evaluate startSplashScreenTimer", function ( ... )
		-- when
		showReadySplash.evaluate(group)
		-- then
		assert.stub(startReadySplashTimer.evaluate).was_called_with(splashImage)
	end)
end)