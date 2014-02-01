getCurrentLevelConfig = {}

currentLevelConfig = currentLevelConfig or require("currentLevelConfig")

function getCurrentLevelConfig.evaluate()
	return currentLevelConfig
end

return getCurrentLevelConfig