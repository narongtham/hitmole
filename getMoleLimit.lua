getMoleLimit = {}

getCurrentLevelConfig = getCurrentLevelConfig or require("getCurrentLevelConfig")

function getMoleLimit.evaluate()
	getCurrentLevelConfig.evaluate()
	return 2
end

return getMoleLimit