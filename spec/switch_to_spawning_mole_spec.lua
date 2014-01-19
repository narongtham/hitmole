describe("swithToswitchToSpawningMole spec", function ( ... )

	local switchToSpawningMole = require 'switchToSpawningMole'
	local spawningMoleSpriteEventHandler = require 'spawningMoleSpriteEventHandler'


	it("Should set sequence 'spawn' to sprite", function ( ... )
		--given
		local sprite = {
			setSequence = function ( ... ) end,
			addEventListener = function ( ... )	end,
			play = function ( ... ) end
		}
		spy.on(sprite, "setSequence")
		--when
		switchToSpawningMole.evaluate(sprite)
		--then
		assert.spy(sprite.setSequence).was_called_with(sprite, "spawn")
	end)

	it("Bind sprite ended event to sprite", function ( ... )
		--given
		local sprite = {
			setSequence = function ( ... ) end,
			addEventListener = function ( ... )	end,
			play = function ( ... ) end
		}
		spy.on(sprite, "addEventListener")
		--when
		switchToSpawningMole.evaluate(sprite)
		--then
		assert.spy(sprite.addEventListener).was_called_with(sprite, "sprite", spawningMoleSpriteEventHandler.onSpriteEvent)
	end)
end)