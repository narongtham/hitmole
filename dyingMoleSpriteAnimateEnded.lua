dyingMoleSpriteAnimateEnded = {}

local delayAfterSpriteAnimateEnded = delayAfterSpriteAnimateEnded or require "delayAfterSpriteAnimateEnded"
local scoreIncrement = scoreIncrement or require "scoreIncrement"
checkNextLevel = checkNextLevel or require("checkNextLevel")

function dyingMoleSpriteAnimateEnded.evaluate(sprite)
	delayAfterSpriteAnimateEnded.start(sprite, dyingMoleSpriteAnimateEnded.afterDelayEnded)
end

function dyingMoleSpriteAnimateEnded.afterDelayEnded()
	scoreIncrement.increaseScore(20)
	checkNextLevel.evaluate()
end

return dyingMoleSpriteAnimateEnded