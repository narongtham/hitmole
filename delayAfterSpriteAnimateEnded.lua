moleContainer = moleContainer or require("moleContainer")

delayAfterSpriteAnimateEnded = {}

function delayAfterSpriteAnimateEnded.start(sprite, afterDelayEndedFunctions)
	print("delayAfterSpriteAnimateEnded.start")
	print(sprite)
	delayAfterSpriteAnimateEnded.waitForRemoveSprite = sprite
	delayAfterSpriteAnimateEnded.afterDelayEndedFunctions = afterDelayEndedFunctions
	timer.performWithDelay(300, delayAfterSpriteAnimateEnded.onDelayEnded)
end

function delayAfterSpriteAnimateEnded.onDelayEnded(event)
	print("delayAfterSpriteAnimateEnded.onDelayEnded")
	print(delayAfterSpriteAnimateEnded.waitForRemoveSprite)
	transition.to(delayAfterSpriteAnimateEnded.waitForRemoveSprite,
	 {alpha=0, time=300, onComplete=delayAfterSpriteAnimateEnded.onFadeOutCompleted})
	delayAfterSpriteAnimateEnded.afterDelayEndedFunctions()
end

function delayAfterSpriteAnimateEnded.onFadeOutCompleted(target)
	moleContainer[target] = nil
	display.remove(target)
end

return delayAfterSpriteAnimateEnded