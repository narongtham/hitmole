describe("switchToDyingMole spec", function ( ... )

	local switchToDyingMole = require("switchToDyingMole")
	local sprite

	setup(function ( ... )
		sprite = {}
		stub(sprite, "setSequence")
		stub(sprite, "play")
		stub(sprite, "addEventListener")
	end)

	it("Set mole sprite sequence to 'dead'.", function ( ... )
		--when
		switchToDyingMole.evaluate(sprite)  
		--then
		assert.stub(sprite.setSequence).was_called_with(sprite, "dead")
	end)

	it("play sprite after set sequence", function ( ... )
		--when
		switchToDyingMole.evaluate(sprite)  
		--then
		assert.stub(sprite.play).was_called_with(sprite)
	end)

	it("Bind sprite event listener to sprite", function ( ... )
		error("Not yet implemented")
	end)

	it("When sprite animate ended it should increase score", function ( ... )
		error("Not yet implemented")
	end)

	it("When sprite animate ended it should remove sprite from view", function ( ... )
		error("Not yet implemented")
	end)
end)