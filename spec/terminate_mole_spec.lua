describe("terminateMole spec", function ( ... )

	local terminateMole = require "terminateMole"
	local switchToDyingMole = require "switchToDyingMole"
	local moleTapSoundPlayer = require "moleTapSoundPlayer"

	local sprite = {}

	setup(function ( ... )
		stub(switchToDyingMole, "evaluate")
		stub(moleTapSoundPlayer, "play")
	end)

	teardown(function ( ... )
		switchToDyingMole.evaluate:revert()
		moleTapSoundPlayer.play:revert()
	end)

	it("When sprite tapped .It should switch mole to dying state.", function ( ... )
		--when
		terminateMole.evaluate(sprite)
		--then
		assert.stub(switchToDyingMole.evaluate).was_called_with(sprite)
	end)

	it("When sprite tapped. It should play tapping sound.", function ( ... )
		--when
		terminateMole.evaluate(event)
		--then
		assert.stub(moleTapSoundPlayer.play).was_called()
	end)
end)