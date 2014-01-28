local delayAfterSpriteAnimateEnded = delayAfterSpriteAnimateEnded or require "delayAfterSpriteAnimateEnded"
local scoreIncrement = scoreIncrement or require "scoreIncrement"

dyingMoleSpriteAnimateEnded = {}

function dyingMoleSpriteAnimateEnded.evaluate(sprite)
	delayAfterSpriteAnimateEnded.start(sprite, dyingMoleSpriteAnimateEnded.afterDelayEnded)
end

function dyingMoleSpriteAnimateEnded.afterDelayEnded()
	scoreIncrement.increaseScore(20)
end

return dyingMoleSpriteAnimateEnded