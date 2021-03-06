hasNextLevel = {}

getCurrentLevelConfig = getCurrentLevelConfig or require("getCurrentLevelConfig")
levelConfigurations = levelConfigurations or require("config.levelConfigurations")

function hasNextLevel.evaluate( ... )
	local currentLevelConfig = getCurrentLevelConfig.evaluate()
	if levelConfigurations[currentLevelConfig.level+1] == nil then
		print("No next level")
		error("No next level")
	end
end

return hasNextLevel