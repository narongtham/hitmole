describe("terminateMole spec", function ( ... )

	local terminateMole = require "terminateMole"
	local switchToDyingMole = require "switchToDyingMole"
	local moleTapSoundPlayer = require "moleTapSoundPlayer"
	local scoreIncrement = require "scoreIncrement"

	local sprite = {}

	setup(function ( ... )
		stub(switchToDyingMole, "evaluate")
		stub(moleTapSoundPlayer, "play")
		stub(scoreIncrement, "increaseScore")
	end)

	teardown(function ( ... )
		switchToDyingMole.evaluate:revert()
		moleTapSoundPlayer.play:revert()
		scoreIncrement.increaseScore:revert()
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

	it("When sprite tapped. It should increase score", function ( ... )
		--when
		terminateMole.evaluate(event)
		--then
		assert.stub(scoreIncrement.increaseScore).was_called_with(20)
	end)
end)