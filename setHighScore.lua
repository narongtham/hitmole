setHighScore = {}

highScore = highScore or require("highScore")

function setHighScore.evaluate(newScore)
	highScore.value = newScore
end

return setHighScore