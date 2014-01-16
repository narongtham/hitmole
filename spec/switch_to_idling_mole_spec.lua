describe("SwitchToIdlingMole spec", function ( ... )

	local switchToIdlingMole = require( "switchToIdlingMole" )

	it("Set mole sprite sequence to 'idle'.", function ( ... )
		--given
		local  sprite = {}
		stub(sprite, "setSequence")
		stub(sprite, "play")
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
		--when
		switchToIdlingMole.evaluate(sprite)
		--then
		assert.stub(sprite.play).was_called_with(sprite)
	end)

	it("Bind tap event listener to sprite", function ( ... )
		error( "Not yet implemented." )
	end)

	it("Start timer for make mole escape", function ( ... )
		error( "Not yet implemented" )
	end)

	it("When sprite tapped .It should switch mole to dying state.", function ( ... )
		error( "Not yet implemented." )
	end)

	it("When timed out. It should switch mole to escaping state.", function ( ... )
		error( "Not yet implemented" )
	end)
end)