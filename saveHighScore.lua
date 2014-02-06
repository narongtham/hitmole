saveHighScore = {}

saveTable = saveTable or require("saveTable")
highScore = highScore or require("highScore")

function saveHighScore.evaluate()
	saveTable.evaluate(highScore, "cvm_highscore")
end

return saveHighScore