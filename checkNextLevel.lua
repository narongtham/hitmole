checkNextLevel = {}

getNextLevelScore = getNextLevelScore or require("getNextLevelScore")
switchToNextLevel = switchToNextLevel or require("switchToNextLevel")
hasNextLevel = hasNextLevel or require("hasNextLevel")

function checkNextLevel.evaluate( ... )
	if pcall( hasNextLevel.evaluate ) then
		local nextLevelScore = getNextLevelScore.evaluate()

		if score >= nextLevelScore then
			switchToNextLevel.evaluate()
		end
	end
end

return checkNextLevel