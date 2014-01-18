describe("SwitchToIdlingMole spec", function ( ... )

	local switchToDyingMole = require("switchToDyingMole")
	local switchToEscapingMole = require("switchToEscapingMole")
	audio = {}
	tapSound = {}
	score = 0
	scoreTxt = {}
	transition = {}
	heart = { {}, {}, {}}

	local switchToIdlingMole = require( "switchToIdlingMole" )
	local sprite = {
		x=10,
		y=10
	}

	setup(function ( ... )
		stub(sprite, "setSequence")
		stub(sprite, "play")
		stub(sprite, "addEventListener")

		stub(transition, "to")
		stub(transition, "cancel")
	end)

	it("Set mole sprite sequence to 'idle'.", function ( ... )
		--when
		switchToIdlingMole.evaluate(sprite)
		--then
		assert.stub(sprite.setSequence).was_called_with(sprite, "idle")
	end)

	it("Play sprite after set sequence", function ( ... )
		--when
		switchToIdlingMole.evaluate(sprite)
		--then
		assert.stub(sprite.play).was_called_with(sprite)
	end)

	it("Bind tap event listener to sprite", function ( ... )
		--when
		switchToIdlingMole.evaluate(sprite)
		--then
		assert.stub(sprite.addEventListener).was_called_with(sprite, "tap", switchToIdlingMole.onTapMole)
	end)

	it("When sprite tapped .It should switch mole to dying state.", function ( ... )
		--given
		local sprite = {}
		local event = {
			target=sprite
		}
		stub(sprite, "removeEventListener")
		stub(switchToDyingMole, "evaluate")
		stub(audio, "play")
		--when
		switchToIdlingMole.onTapMole(event)
		--then
		assert.stub(switchToDyingMole.evaluate).was_called_with(sprite)
		switchToDyingMole.evaluate:revert()
	end)

	it("When sprite tapped.It should remove tap event listener.", function ( ... )
		--given
		local sprite = {}
		local event = {
			target=sprite
		}
		stub(sprite, "removeEventListener")
		stub(switchToDyingMole, "evaluate")
		stub(audio, "play")
		--when
		switchToIdlingMole.onTapMole(event)
		--then
		assert.stub(sprite.removeEventListener).was_called_with(sprite, "tap", switchToIdlingMole.onTapMole)
		switchToDyingMole.evaluate:revert()
	end)

	it("When sprite tapped. It should play tapping sound.", function ( ... )
		--given
		local sprite = {}
		local event = {
			target=sprite
		}
		stub(sprite, "removeEventListener")
		stub(switchToDyingMole, "evaluate")
		stub(audio, "play")
		--when
		switchToIdlingMole.onTapMole(event)
		--then
		assert.stub(audio.play).was_called_with(tapSound, {channel=2, loops=0})
		switchToDyingMole.evaluate:revert()
	end)

	it("When sprite tapped. It should increase score", function ( ... )
		--given
		local sprite = {}
		local event = {
			target=sprite
		}
		stub(sprite, "removeEventListener")
		stub(switchToDyingMole, "evaluate")
		stub(audio, "play")

		score = 0
		--when
		switchToIdlingMole.onTapMole(event)
		--then
		assert.are.same("Score: 20", scoreTxt.text)
		switchToDyingMole.evaluate:revert()
	end)

	it("Start timer for make mole escape", function ( ... )
		--when
		switchToIdlingMole.evaluate(sprite)
		--then
		assert.stub(transition.to)
			.was_called_with(sprite, {time=3000, x=sprite.x, y=sprite.y, onComplete=switchToIdlingMole.onTimeToLiveExeed })
	end)

	it("When timed out. It should decrease heart.", function ( ... )
		--given
		local sprite = {}
		stub(sprite, "removeEventListener")
		stub(display, "remove")
		stub(switchToEscapingMole, "evaluate")
		escapeCount = 3

		--when
		switchToIdlingMole.onTimeToLiveExeed(sprite)
		--then
		assert.stub(display.remove).was_called_with(heart[escapeCount])
		assert.are.equal(escapeCount, 2)
	end)

	it("When timed out. It should remove tap event listener.", function ( ... )
		--given
		local sprite = {}
		stub(sprite, "removeEventListener")
		stub(display, "remove")
		stub(switchToEscapingMole, "evaluate")
		--when
		switchToIdlingMole.onTimeToLiveExeed(sprite)
		--then
		assert.stub(sprite.removeEventListener).was_called_with(sprite, "tap", switchToIdlingMole.onTapMole)
	end)

	it("When timed out. It should switch mole to escaping state.", function ( ... )
		--given
		local sprite = {}
		stub(sprite, "removeEventListener")
		stub(display, "remove")
		stub(switchToEscapingMole, "evaluate")

		--when
		switchToIdlingMole.onTimeToLiveExeed(sprite)
		--then
		assert.stub(switchToEscapingMole.evaluate).was_called_with(sprite)
		switchToEscapingMole.evaluate:revert()
	end)
end)