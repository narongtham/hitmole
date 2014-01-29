local removeAllLifePoints = removeAllLifePoints or require("removeAllLifePoints")
local removeAllMoles = removeAllMoles or require("removeAllMoles")

cleanupGameState = {}

function cleanupGameState.evaluate()
	removeAllLifePoints.evaluate()
	removeAllMoles.evaluate()
end

return cleanupGameState