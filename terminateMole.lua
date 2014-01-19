switchToDyingMole = switchToDyingMole or require("switchToDyingMole")

terminateMole = {}

function terminateMole.evaluate(sprite)
	audio.play( tapSound, {channel=2, loops=0})
	score = score + 20
	scoreTxt.text = "Score: " .. score
	switchToDyingMole.evaluate(sprite)
end

return terminateMole