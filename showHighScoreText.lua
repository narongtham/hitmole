showhighScoreText = {}

getHighScore = getHighScore or require( "getHighScore" )
getFontNameByPlatform = getFontNameByPlatform or require( "getFontNameByPlatform" )

function showhighScoreText.evaluate(group, verticalPos)
	local highScore = getHighScore.evaluate()
	local fontName = getFontNameByPlatform.evaluate()

	--local verticalPos = 720

	local hiScoreText = display.newText( "High score: "..highScore, 0, 0, fontName, 40 )
	hiScoreText.x = DISPLAY_CENTER_X+4
	hiScoreText.y = verticalPos+4
	hiScoreText:setFillColor( 110/255, 53/255, 10/255 )

	local outlineText = display.newText( "High score: "..highScore, 0, 0, fontName, 40 )
	outlineText.x = DISPLAY_CENTER_X
	outlineText.y = verticalPos
	outlineText:setFillColor( 254/255, 233/255, 6/255 )

	group:insert( hiScoreText )
	group:insert( outlineText )

	return hiScoreText
end

return showhighScoreText