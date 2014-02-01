checkNextLevel = {}

getNextLevelScore = getNextLevelScore or require("getNextLevelScore")
switchToNextLevel = switchToNextLevel or require("switchToNextLevel")
hasNextLevel = hasNextLevel or require("hasNextLevel")

function checkNextLevel.evaluate( ... )
	if pcall( hasNextLevel.evaluate ) then
		local nextLevelScore = getNextLevelScore.evaluate()

		if score >= nextLevelScore then
			print("Go to next level")
			switchToNextLevel.evaluate()
		end
	end
end

return checkNextLevel