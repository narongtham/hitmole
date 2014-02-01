getMoleLimit = {}

getCurrentLevelConfig = getCurrentLevelConfig or require("getCurrentLevelConfig")

function getMoleLimit.evaluate()
	local currentLevel = getCurrentLevelConfig.evaluate()
	return currentLevel.moleLimit
end

return getMoleLimit