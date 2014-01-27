moleContainer = moleContainer or require("moleContainer")

delayAfterSpriteAnimateEnded = {}

function delayAfterSpriteAnimateEnded.start(sprite, afterDelayEndedFunctions)
	delayAfterSpriteAnimateEnded.waitForRemoveSprite = sprite
	delayAfterSpriteAnimateEnded.afterDelayEndedFunctions = afterDelayEndedFunctions
	timer.performWithDelay(300, delayAfterSpriteAnimateEnded.onDelayEnded)
end

function delayAfterSpriteAnimateEnded.onDelayEnded(event)
	transition.to(delayAfterSpriteAnimateEnded.waitForRemoveSprite,
	 {alpha=0, time=300, onComplete=delayAfterSpriteAnimateEnded.onFadeOutCompleted})
	delayAfterSpriteAnimateEnded.afterDelayEndedFunctions()
end

function delayAfterSpriteAnimateEnded.onFadeOutCompleted(event)
	--print(event.target)
	display.remove(event.target)
end

return delayAfterSpriteAnimateEnded