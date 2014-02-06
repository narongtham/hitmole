checkHighScore = {}

getHighScore = getHighScore or require("getHighScore")
setHighScore = setHighScore or require("setHighScore")
saveHighScore = saveHighScore or require("saveHighScore")
--showNewHighImage = showNewHighImage or require("showNewHighImage")
showHighScoreText = showHighScoreText or require("showHighScoreText") 

function checkHighScore.evaluate(group)
	local storedHighScore = getHighScore.evaluate()

	if score > storedHighScore then
		setHighScore.evaluate(score)
		saveHighScore.evaluate()
		--showNewHighImage.evaluate()
	end

	showHighScoreText.evaluate(group)
end

return checkHighScore