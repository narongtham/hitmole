onReadySplashtimerEnded = {}

startGenerateMoleTimer = startGenerateMoleTimer or require("startGenerateMoleTimer")
showReadySplash = showReadySplash or require("showReadySplash")

function onReadySplashtimerEnded.evaluate(event)
	display.remove(event.source.params.target)

	local imageSequenceData = event.source.params.imageSequenceData

	if imageSequenceData.next then
		showReadySplash.evaluate(currentViewGroup, imageSequenceData.next)
	else
		startGenerateMoleTimer.evaluate()
	end
end

return onReadySplashtimerEnded