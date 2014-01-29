local removeAllLifePoints = removeAllLifePoints or require("removeAllLifePoints")
local removeAllMoles = removeAllMoles or require("removeAllMoles")
local cancelGenerateMoleTimer = cancelGenerateMoleTimer or require("cancelGenerateMoleTimer")

cleanupGameState = {}

function cleanupGameState.evaluate()
	removeAllLifePoints.evaluate()
	removeAllMoles.evaluate()
	cancelGenerateMoleTimer.evaluate()
end

return cleanupGameState