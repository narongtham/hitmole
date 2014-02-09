checkHighScore = {}

getHighScore = getHighScore or require("getHighScore")
setHighScore = setHighScore or require("setHighScore")
saveHighScore = saveHighScore or require("saveHighScore")
showNewHighScoreText = showNewHighScoreText or require("showNewHighScoreText")
showHighScoreText = showHighScoreText or require("showHighScoreText") 

function checkHighScore.evaluate(group)
	local storedHighScore = getHighScore.evaluate()

	if score > storedHighScore then
		setHighScore.evaluate(score)
		saveHighScore.evaluate()
		showNewHighScoreText.evaluate(group)
	else
		showHighScoreText.evaluate(group)
	end
end

return checkHighScore