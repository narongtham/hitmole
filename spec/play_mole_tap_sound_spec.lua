describe("playMoleTapSound spec", function ( ... )

	local  moleTapSoundPlayer = require "moleTapSoundPlayer"

	audio = {}
	tapSound = {}

	it("Call audio to play tapSound", function ( ... )
		--given
		stub(audio, "play")
		--when
		moleTapSoundPlayer.play()
		--then
		assert.stub(audio.play).was_called_with(tapSound)
	end)
end)