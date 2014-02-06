showhighScoreText = {}

getHighScore = getHighScore or require( "getHighScore" )
getFontNameByPlatform = getFontNameByPlatform or require( "getFontNameByPlatform" )

function showhighScoreText.evaluate(group)
	local highScore = getHighScore.evaluate()
	local fontName = getFontNameByPlatform.evaluate()

	local hiScoreText = display.newText( "High score: "..highScore, 0, 0, fontName, 40 )
	hiScoreText.x = DISPLAY_CENTER_X
	hiScoreText.y = 720
	hiScoreText:setFillColor( 65/255, 65/255, 65/255 )

	group:insert( hiScoreText )

	return hiScoreText
end

return showhighScoreText