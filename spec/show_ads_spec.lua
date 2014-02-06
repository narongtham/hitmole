describe("showAds", function ( ... )
	local showAds

	setup(function ( ... )

		display = {
			screenOriginX = 0,
			screenOriginY = 0,
			viewableContentHeight = 720
		}

		ads = {}
		stub(ads, "show")

		showAds = require("showAds")
	end)

	it("Call ads.show with proper paremetes", function ( ... )
		-- when
		showAds.evaluate()
		-- then
		assert.stub(ads.show).was_called_with("banner", { x = display.screenOriginX , y = display.screenOriginY + display.viewableContentHeight - 90 })
	end)
end)