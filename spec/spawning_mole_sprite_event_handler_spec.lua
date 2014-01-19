describe("Spawning mole sprite event handler spec", function ( ... )
	
	local spawningMoleSpriteEventHandler = require "spawningMoleSpriteEventHandler"
	local switchToIdlingMole = require 'switchToIdlingMole'

	it("When sprite animate ended, It will switch to idling mole", function ( ... )
		--given
		local sprite = {
			removeEventListener=function ( ... ) end
		}

		local event = {
			phase="ended",
			target=sprite
		}

		stub(switchToIdlingMole, "evaluate")
		--when
		spawningMoleSpriteEventHandler.onSpriteEvent(event)
		--then
		assert.stub(switchToIdlingMole.evaluate).was_called_with(sprite)
		switchToIdlingMole.evaluate:revert()
	end)

	it("When sprite animate ended, It will remove sprite event listener", function ( ... )
		--given
		local sprite = {
			removeEventListener=function ( ... ) end
		}

		local event = {
			phase="ended",
			target=sprite
		}

		stub(switchToIdlingMole, "evaluate")
		stub(sprite, "removeEventListener")
		--when
		spawningMoleSpriteEventHandler.onSpriteEvent(event)
		--then
		assert.stub(sprite.removeEventListener).was_called_with(sprite, "sprite", spawningMoleSpriteEventHandler.onSpriteEvent)
		switchToIdlingMole.evaluate:revert()
	end)
end)