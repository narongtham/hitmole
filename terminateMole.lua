switchToDyingMole = switchToDyingMole or require("switchToDyingMole")
moleTapSoundPlayer = moleTapSoundPlayer or require("moleTapSoundPlayer")

terminateMole = {}

function terminateMole.evaluate(sprite)
	moleTapSoundPlayer.play()
	switchToDyingMole.evaluate(sprite)
end

return terminateMole