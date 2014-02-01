getTimeToLive = {}

getCurrentLevelConfig = getCurrentLevelConfig or require("getCurrentLevelConfig")

function getTimeToLive.evaluate()
	local currentLevelConfig = getCurrentLevelConfig.evaluate()
	return currentLevelConfig.timeToLive
end

return getTimeToLive