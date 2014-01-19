scoreIncrement = {}

function scoreIncrement.increaseScore(addenScore)
	score = score+addenScore
	scoreTxt.text = "Score: " .. score
end

return scoreIncrement