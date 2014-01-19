describe("SwitchToIdlingMole spec", function ( ... )

	local switchToIdlingMole = require( "switchToIdlingMole" )
	local switchToEscapingMole = require("switchToEscapingMole")
	local terminateMole = require("terminateMole")
	
	transition = {}
	heart = { {}, {}, {}}
	
	local sprite = {
		x=10,
		y=10
	}

	setup(function ( ... )
		stub(sprite, "setSequence")
		stub(sprite, "play")
		stub(sprite, "addEventListener")
		stub(sprite, "removeEventListener")

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

	it("Start timer for make mole escape", function ( ... )
		--when
		switchToIdlingMole.evaluate(sprite)
		--then
		assert.stub(transition.to)
			.was_called_with(sprite, {time=3000, x=sprite.x, y=sprite.y, onComplete=switchToIdlingMole.onTimeToLiveExeed })
	end)

	it("When sprite tapped .It should call mole terminater.", function ( ... )
		--given
		local event = {
			target=sprite
		}
		
		stub(terminateMole, "evaluate")
		--when
		switchToIdlingMole.onTapMole(event)
		--then
		assert.stub(terminateMole.evaluate).was_called_with(sprite)
		terminateMole.evaluate:revert()
	end)

	

	it("When sprite tapped.It should remove tap event listener.", function ( ... )
		--given
		local event = {
			target=sprite
		}
		stub(terminateMole, "evaluate")

		--when
		switchToIdlingMole.onTapMole(event)
		--then
		assert.stub(sprite.removeEventListener).was_called_with(sprite, "tap", switchToIdlingMole.onTapMole)
		terminateMole.evaluate:revert()
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