showReadySplash = {}

startReadySplashTimer = startReadySplashTimer or require("startReadySplashTimer")

function showReadySplash.evaluate(group, splashImageSequenceData)
	local splashImage = display.newImage( splashImageSequenceData.value )
	splashImage.x = DISPLAY_CENTER_X
	splashImage.y = DISPLAY_CENTER_Y
	group:insert(splashImage)

	startReadySplashTimer.evaluate(splashImage)
end

return showReadySplash