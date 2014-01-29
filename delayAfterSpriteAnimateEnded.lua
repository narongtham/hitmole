moleContainer = moleContainer or require("moleContainer")

delayAfterSpriteAnimateEnded = {}

function delayAfterSpriteAnimateEnded.start(sprite, afterDelayEndedFunctions)
	print("delayAfterSpriteAnimateEnded.start")
	print(sprite)
	
	local timerInstance = timer.performWithDelay(300, delayAfterSpriteAnimateEnded.onDelayEnded)
	timerInstance.params = {
		waitForRemoveSprite = sprite,
		afterDelayEndedFunctions = afterDelayEndedFunctions
	}
end

function delayAfterSpriteAnimateEnded.onDelayEnded(event)
	print("delayAfterSpriteAnimateEnded.onDelayEnded")
	local params = event.source.params
	print(params.waitForRemoveSprite)
	transition.to(params.waitForRemoveSprite,
	 {alpha=0, time=300, onComplete=delayAfterSpriteAnimateEnded.onFadeOutCompleted})
	params.afterDelayEndedFunctions()
end

function delayAfterSpriteAnimateEnded.onFadeOutCompleted(target)
	moleContainer[target] = nil
	display.remove(target)
end

return delayAfterSpriteAnimateEnded