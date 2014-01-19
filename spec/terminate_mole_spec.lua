describe("terminateMole spec", function ( ... )

	local terminateMole = require "terminateMole"
	local switchToDyingMole = require "switchToDyingMole"

	audio = {}
	tapSound = {}
	score = 0
	scoreTxt = {}

	local sprite = {}

	it("When sprite tapped .It should switch mole to dying state.", function ( ... )
		--given
		stub(switchToDyingMole, "evaluate")
		stub(audio, "play")
		--when
		terminateMole.evaluate(sprite)
		--then
		assert.stub(switchToDyingMole.evaluate).was_called_with(sprite)
		switchToDyingMole.evaluate:revert()
	end)

	it("When sprite tapped. It should play tapping sound.", function ( ... )
		--given
		stub(switchToDyingMole, "evaluate")
		stub(audio, "play")
		--when
		terminateMole.evaluate(event)
		--then
		assert.stub(audio.play).was_called_with(tapSound, {channel=2, loops=0})
		switchToDyingMole.evaluate:revert()
	end)

	it("When sprite tapped. It should increase score", function ( ... )
		--given
		stub(switchToDyingMole, "evaluate")
		stub(audio, "play")
		score = 0
		--when
		terminateMole.evaluate(event)
		--then
		assert.are.same("Score: 20", scoreTxt.text)
		switchToDyingMole.evaluate:revert()
	end)
end)