local delayAfterSpriteAnimateEnded = delayAfterSpriteAnimateEnded or require "delayAfterSpriteAnimateEnded"
local scoreIncrement = scoreIncrement or require "scoreIncrement"
--local createSpawningMole = createSpawningMole or require "createSpawningMole"

dyingMoleSpriteAnimateEnded = {}

function dyingMoleSpriteAnimateEnded.evaluate(sprite)
	delayAfterSpriteAnimateEnded.start(sprite, dyingMoleSpriteAnimateEnded.afterDelayEnded)
end

function dyingMoleSpriteAnimateEnded.afterDelayEnded()
	scoreIncrement.increaseScore(20)
	createSpawningMole.create()
end

return dyingMoleSpriteAnimateEnded