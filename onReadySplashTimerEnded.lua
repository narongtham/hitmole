onReadySplashtimerEnded = {}

startGenerateMoleTimer = startGenerateMoleTimer or require("startGenerateMoleTimer")

function onReadySplashtimerEnded.evaluate(event)
	display.remove(event.source.params.target)
	startGenerateMoleTimer.evaluate()
end

return onReadySplashtimerEnded