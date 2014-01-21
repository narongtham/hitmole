describe("switchToDyingMole spec", function ( ... )

	local switchToDyingMole = require("switchToDyingMole")
	local dyingMoleSpriteAnimateEnded = require "dyingMoleSpriteAnimateEnded"

	local sprite

	timer = {}
	display = require("spec.corona-busted.mocks.mockDisplay")

	setup(function ( ... )
		sprite = {}
		stub(sprite, "setSequence")
		stub(sprite, "play")
		stub(sprite, "addEventListener")
		stub(sprite, "removeEventListener")
		stub(dyingMoleSpriteAnimateEnded, "evaluate")
	end)

	teardown(function ( ... )
		dyingMoleSpriteAnimateEnded.evaluate:revert()
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
		--when
		switchToDyingMole.evaluate(sprite)  
		--then
		assert.stub(sprite.addEventListener).was_called_with(sprite, "sprite", switchToDyingMole.spriteEventHandler)
	end)

	it("When sprite animate ended it should call dyingMoleSpriteAnimateEnded.evaluate()", function ( ... )
		--given
		local event = {
			phase="ended",
			target = sprite
		}
		--when
		switchToDyingMole.spriteEventHandler(event)
		--then
		assert.stub(dyingMoleSpriteAnimateEnded.evaluate).was_called_with(sprite)
	end)

	it("When sprite animate ended it should remove sprite event listener", function ( ... )
		--given
		local event = {
			phase="ended",
			target = sprite
		}
		--when
		switchToDyingMole.spriteEventHandler(event)
		--then
		assert.stub(sprite.removeEventListener)
			.was_called_with(sprite, "sprite", switchToDyingMole.spriteEventHandler)
	end)
end)