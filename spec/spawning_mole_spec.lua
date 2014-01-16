describe("Spawning mole spec", function ( ... )

	local SpawningMole = require 'SpawningMole'
	local display = require 'spec.corona-busted.mocks.mockDisplay'

	local spawningMole

	setup(function ( ... )
		spawningMole = SpawningMole.new()	
	end)

	it("Should set sequence 'spawn' to sprite", function ( ... )
		--given
		local sprite = {
			setSequence = function ( ... )
				-- body
			end
		}
		spy.on(sprite, "setSequence")
		--when
		spawningMole:setSprite(sprite)
		--then
		assert.spy(sprite.setSequence).was_called_with(sprite, "spawn")
	end)

	it("Shoud switch to idling mole when sprite end", function ( ... )
		error("Not yet implemented")
	end)
end)