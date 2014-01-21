local delayAfterSpriteAnimateEnded = delayAfterSpriteAnimateEnded or require "delayAfterSpriteAnimateEnded"
local decreaseLifePoint = decreaseLifePoint or require "decreaseLifePoint"
local checkGameOver = checkGameOver or require "checkGameOver"

escapingMoleSpriteAnimateEnded = {}

function escapingMoleSpriteAnimateEnded.evaluate(sprite)
	delayAfterSpriteAnimateEnded.start(sprite, escapingMoleSpriteAnimateEnded.afterDelayEnded)
end

function escapingMoleSpriteAnimateEnded.afterDelayEnded()
	decreaseLifePoint.decreaseByOne()
	checkGameOver.evaluate()
end

return escapingMoleSpriteAnimateEnded