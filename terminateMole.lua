switchToDyingMole = switchToDyingMole or require("switchToDyingMole")
moleTapSoundPlayer = moleTapSoundPlayer or require("moleTapSoundPlayer")
scoreIncrement = scoreIncrement or require("scoreIncrement")

terminateMole = {}

function terminateMole.evaluate(sprite)
	moleTapSoundPlayer.play()
	scoreIncrement.increaseScore(20)
	switchToDyingMole.evaluate(sprite)
end

return terminateMole