showAds = {}

ads = ads or require("ads")

function showAds.evaluate()
	ads.show("banner", { x = display.screenOriginX , y = display.screenOriginY + display.viewableContentHeight - 90 })
end

return showAds