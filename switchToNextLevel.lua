switchToNextLevel = {}

getCurrentLevelConfig = getCurrentLevelConfig or require("getCurrentLevelConfig")
levelConfigurations = levelConfigurations or require("config.levelConfigurations")

function switchToNextLevel.evaluate()
	local levelConfig = getCurrentLevelConfig.evaluate()
	currentLevelConfig = levelConfigurations[levelConfig.level+1]
end

return switchToNextLevel