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

	local verticalPosition = 680

	if score > storedHighScore then
		setHighScore.evaluate(score)
		saveHighScore.evaluate()
		highScoreText = showNewHighScoreText.evaluate(group, verticalPosition)
	else
		highScoreText = showHighScoreText.evaluate(group, verticalPosition)
	end

	showGameOverScoreText.evaluate(group, highScoreText)
end

return checkHighScore