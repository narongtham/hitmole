switchToDyingMole = switchToDyingMole or require("switchToDyingMole")
moleTapSoundPlayer = moleTapSoundPlayer or require("moleTapSoundPlayer")

terminateMole = {}

function terminateMole.evaluate(sprite)
	moleTapSoundPlayer.play()
	score = score + 20
	scoreTxt.text = "Score: " .. score
	switchToDyingMole.evaluate(sprite)
end

return terminateMole