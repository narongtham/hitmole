startReadySplashTimer = {}

onReadySplashTimerEnded = onReadySplashTimerEnded or require("onReadySplashTimerEnded")

function startReadySplashTimer.evaluate(target)
	local timerInstance = timer.performWithDelay(1000, onReadySplashTimerEnded.evaluate)
	timerInstance.params = {
		target = target
	}
end

return startReadySplashTimer