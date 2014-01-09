describe("main specs", function ()
	display = require("spec.corona-busted.mocks.mockDisplay")
	
	setup(function ( ... )
		display.contentCenterX = 120
		display.contentCenterY = 150
		display.viewableContentWidth = 720
		display.viewableContentHeight = 1280
		display.HiddenStatusBar = true
		
		storyboard = {
			gotoScene = function ( sceneName )
			end
		}

		stub(storyboard, "gotoScene")

		stub(display, "setStatusBar")

		require("main")
	end)
	

	it("Set contentCenterX of display to centerX", function ()
		assert.are.equal(display.contentCenterX, DISPLAY_CENTER_X)
	end)

	it("Set contentCenterY to centerY", function()
		assert.are.equal(display.contentCenterY, DISPLAY_CENTER_Y)
	end)

	it("Set viewableContentWidth to CONTENT_WIDTH", function()
		assert.are.equal(display.viewableContentWidth, CONTENT_WIDTH)
	end)

	it("Set viewableContentHeight to CONTENT_HEIGHT", function()
		assert.are.equal(display.viewableContentHeight, CONTENT_HEIGHT)
	end)

	it("Hide statusbar", function ( ... )
		assert.stub(display.setStatusBar).was_called_with(display.HiddenStatusBar)
	end)

	it("Go to splash scene", function ( ... )
		assert.stub(storyboard.gotoScene).was_called_with("splashScene")
	end)
end)