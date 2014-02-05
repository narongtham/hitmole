loadHighScore = {}

loadHighScoreFile = loadHighScoreFile or require("loadHighScoreFile")

function loadHighScore.evaluate()
	loadHighScoreFile.evaluate()
end

return loadHighScore