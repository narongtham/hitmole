checkHighScore = {}

getHighScore = getHighScore or require("getHighScore")
setHighScore = setHighScore or require("setHighScore")
saveHighScore = saveHighScore or require("saveHighScore")
showNewHighScoreText = showNewHighScoreText or require("showNewHighScoreText")
showHighScoreText = showHighScoreText or require("showHighScoreText") 
showGameOverScoreText = showGameOverScoreText or require("showGameOverScoreText")

function checkHighScore.evaluate(group)
	local storedHighScore = getHighScore.evaluate()

	local highScoreText

	if score > storedHighScore then
		setHighScore.evaluate(score)
		saveHighScore.evaluate()
		highScoreText = showNewHighScoreText.evaluate(group)
	else
		highScoreText = showHighScoreText.evaluate(group)
	end

	showGameOverScoreText.evaluate(group, highScoreText)
end

return checkHighScore