local removeAllLifePoints = removeAllLifePoints or require("removeAllLifePoints")

cleanupGameState = {}

function cleanupGameState.evaluate()
	removeAllLifePoints.evaluate()
end

return cleanupGameState