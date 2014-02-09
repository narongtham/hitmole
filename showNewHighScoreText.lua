showNewHighScoreText = {}

showHighScoreText = showHighScoreText or require("showHighScoreText")
showNewHighBadge = showNewHighBadge or require("showNewHighBadge")

function showNewHighScoreText.evaluate(group)
	local highScoreText = showHighScoreText.evaluate(group)
	showNewHighBadge.evaluate(group, highScoreText)

	return highScoreText
end

return showNewHighScoreText