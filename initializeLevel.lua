initializeLevel = {}

currentLevelConfig = currentLevelConfig or require("currentLevelConfig")
levelconfigurations = levelconfigurations or require("config.levelConfigurations")

function initializeLevel.evaluate()
	currentLevelConfig = levelConfigurations[1]
end

return initializeLevel