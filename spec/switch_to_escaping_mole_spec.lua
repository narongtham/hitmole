describe("switchToEscapingMole spec", function ( ... )

	local switchToEscapingMole = require "switchToEscapingMole"
	local escapingMoleSpriteAnimateEnded = require "escapingMoleSpriteAnimateEnded"
	local sprite

	setup(function ( ... )
		sprite = {}
		stub(sprite, "setSequence")
		stub(sprite, "play")
		stub(sprite, "addEventListener")
		stub(sprite, "removeEventListener")
		stub(escapingMoleSpriteAnimateEnded, "evaluate")
	end)

	teardown(function ( ... )
		escapingMoleSpriteAnimateEnded.evaluate:revert()
	end)

	it("Set mole sprite sequence to 'leave'.", function ( ... )
		--when
		switchToEscapingMole.evaluate(sprite)  
		--then
		assert.stub(sprite.setSequence).was_called_with(sprite, "escape")
	end)

	it("play sprite after set sequence", function ( ... )
		--when
		switchToEscapingMole.evaluate(sprite)  
		--then
		assert.stub(sprite.play).was_called_with(sprite)
	end)

	it("Bind sprite event listener to sprite", function ( ... )
		--when
		switchToEscapingMole.evaluate(sprite)  
		--then
		assert.stub(sprite.addEventListener).was_called_with(sprite, "sprite", switchToEscapingMole.spriteEventHandler)
	end)

	it("When sprite animate ended it should call escapingMoleSpriteAnimateEnded.evaluate()", function ( ... )
		--given
		local event = {
			phase="ended",
			target = sprite
		}
		--when
		switchToEscapingMole.spriteEventHandler(event)
		--then
		assert.stub(escapingMoleSpriteAnimateEnded.evaluate).was_called_with(sprite)
	end)

	it("When sprite animate ended it should remove sprite event listener", function ( ... )
		--given
		local event = {
			phase="ended",
			target = sprite
		}
		--when
		switchToEscapingMole.spriteEventHandler(event)
		--then
		assert.stub(sprite.removeEventListener)
			.was_called_with(sprite, "sprite", switchToEscapingMole.spriteEventHandler)
	end)
end)