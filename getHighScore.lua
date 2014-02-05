getHighScore = {}

highScore = highScore or require( "highScore" )

function getHighScore.evaluate()
	return highScore.value
end

return getHighScore