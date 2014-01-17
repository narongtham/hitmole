describe("Spawning mole spec", function ( ... )

	local SpawningMole = require 'SpawningMole'
	local display = require 'spec.corona-busted.mocks.mockDisplay'
	local switchToIdlingMole = require 'switchToIdlingMole'

	local spawningMole

	setup(function ( ... )
		spawningMole = SpawningMole.new()	
	end)

	it("Should set sequence 'spawn' to sprite", function ( ... )
		--given
		local sprite = {
			setSequence = function ( ... ) end,
			addEventListener = function ( ... )	end,
			play = function ( ... ) end
		}
		spy.on(sprite, "setSequence")
		--when
		spawningMole:setSprite(sprite)
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
		spawningMole:setSprite(sprite)
		--then
		assert.spy(sprite.addEventListener).was_called_with(sprite, "sprite", spawningMole.spriteEventHandler)
	end)

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
		spawningMole.spriteEventHandler(event)
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
		spawningMole.spriteEventHandler(event)
		--then
		assert.stub(sprite.removeEventListener).was_called_with(sprite, "sprite", spawningMole.spriteEventHandler)
		switchToIdlingMole.evaluate:revert()
	end)
end)