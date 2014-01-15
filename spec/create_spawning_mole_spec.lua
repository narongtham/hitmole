describe("Create spawning mole spec", function ( ... )
	SpawningMole = require("SpawningMole")
	generateMolePosition = {
		generate = function ( ... )
			return { x=10, y=20}
		end
	}

	local createSpawningMole = require("createSpawningMole")
	
	it("Should return spawning mole", function ( ... )
		--when
		local spawningMole = createSpawningMole.create()
		--then
		assert.are_not.Nil(spawningMole)
	end)

	it("Should call generateMolePosition", function ( ... )
		--given
		spy.on(generateMolePosition, "generate")
		--when
		local spawningMole = createSpawningMole.create()
		--then
		assert.spy(generateMolePosition.generate).was_called()
	end)

	it("Should set randomed position to mole", function ( ... )
		error("Not yet implemented")
	end)

	it("Should set sequence 'spawn' to mole", function ( ... )
		error( "Not yet implemented")
	end)
end)