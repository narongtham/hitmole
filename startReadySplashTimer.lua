startReadySplashTimer = {}

onReadySplashTimerEnded = onReadySplashTimerEnded or require("onReadySplashTimerEnded")
readySplashConfigurations = readySplashConfigurations or require("config.readySplashConfigurations")

function startReadySplashTimer.evaluate(target, imageSequenceData)
	local timerInstance = timer.performWithDelay(readySplashConfigurations.delay, onReadySplashTimerEnded.evaluate)
	timerInstance.params = {
		target = target,
		imageSequenceData = imageSequenceData
	}
end

return startReadySplashTimer