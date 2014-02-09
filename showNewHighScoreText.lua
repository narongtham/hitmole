showNewHighScoreText = {}

showHighScoreText = showHighScoreText or require("showHighScoreText")
showNewHighBadge = showNewHighBadge or require("showNewHighBadge")

function showNewHighScoreText.evaluate(group, verticalPosition)
	local highScoreText = showHighScoreText.evaluate(group, verticalPosition)
	showNewHighBadge.evaluate(group, highScoreText)

	return highScoreText
end

return showNewHighScoreText