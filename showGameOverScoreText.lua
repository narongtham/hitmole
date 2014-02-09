showhighScoreText = {}

getHighScore = getHighScore or require( "getHighScore" )
getFontNameByPlatform = getFontNameByPlatform or require( "getFontNameByPlatform" )

function showhighScoreText.evaluate(group, target)

	local fontName = getFontNameByPlatform.evaluate()

	local verticalPos = target.y + (target.contentHeight/2) + 32

	local shadowText = display.newText( "Your score: "..score, 0, 0, fontName, 40 )
	shadowText.x = DISPLAY_CENTER_X+4
	shadowText.y = verticalPos+4
	shadowText:setFillColor( 110/255, 53/255, 10/255 )

	local highScoreText = display.newText( "Your score: "..score, 0, 0, fontName, 40 )
	highScoreText.x = DISPLAY_CENTER_X
	highScoreText.y = verticalPos
	highScoreText:setFillColor( 1,1,1 )

	group:insert( shadowText )
	group:insert( highScoreText )

	return highScoreText
end

return showhighScoreText