getNextLevelScore = {}

getCurrentLevelConfig = getCurrentLevelConfig or require("getCurrentLevelConfig")

function getNextLevelScore.evaluate()
	local currentLevelConfig = getCurrentLevelConfig.evaluate()
	return currentLevelConfig.nextLevelScore
end

return getNextLevelScore