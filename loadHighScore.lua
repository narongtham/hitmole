loadHighScore = {}

loadHighScoreFile = loadHighScoreFile or require("loadHighScoreFile")

function loadHighScore.evaluate()
	local isOk, value = pcall(loadHighScoreFile.evaluate)

	if isOk then
		highScore = value
	end
end

return loadHighScore