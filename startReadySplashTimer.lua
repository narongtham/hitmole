startReadySplashTimer = {}

onReadySplashTimerEnded = onReadySplashTimerEnded or require("onReadySplashTimerEnded")

function startReadySplashTimer.evaluate()
	timer.performWithDelay(1000, onReadySplashTimerEnded.evaluate)
end

return startReadySplashTimer