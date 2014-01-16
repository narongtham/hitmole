describe("SwitchToIdlingMole spec", function ( ... )

	local switchToDyingMole = require("switchToDyingMole")

	local switchToIdlingMole = require( "switchToIdlingMole" )

	it("Set mole sprite sequence to 'idle'.", function ( ... )
		--given
		local  sprite = {}
		stub(sprite, "setSequence")
		stub(sprite, "play")
		stub(sprite, "addEventListener")
		--when
		switchToIdlingMole.evaluate(sprite)
		--then
		assert.stub(sprite.setSequence).was_called_with(sprite, "idle")
	end)

	it("Play sprite after set sequence", function ( ... )
		--given
		local  sprite = {}
		stub(sprite, "setSequence")
		stub(sprite, "play")
		stub(sprite, "addEventListener")
		--when
		switchToIdlingMole.evaluate(sprite)
		--then
		assert.stub(sprite.play).was_called_with(sprite)
	end)

	it("Bind tap event listener to sprite", function ( ... )
		--given
		local  sprite = {}
		stub(sprite, "setSequence")
		stub(sprite, "play")
		stub(sprite, "addEventListener")
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

		stub(switchToDyingMole, "evaluate")
		--when
		switchToIdlingMole.onTapMole(event)
		--then
		assert.stub(switchToDyingMole.evaluate).was_called_with(sprite)
		switchToDyingMole.evaluate:revert()
	end)

	it("Start timer for make mole escape", function ( ... )
		error( "Not yet implemented" )
	end)

	it("When timed out. It should switch mole to escaping state.", function ( ... )
		error( "Not yet implemented" )
	end)
end)