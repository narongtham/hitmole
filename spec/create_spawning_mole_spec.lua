describe("Create spawning mole spec", function ( ... )
	SpawningMole = require("SpawningMole")
	display = require('spec.corona-busted.mocks.mockDisplay')
	
	generated_x = 10
	generated_y = 20
	generateMolePosition = {
		generate = function ( ... )
			return { 
				x=generated_x,
			 	y=generated_y
			}
		end
	}
	moleSpriteMetaData = {
		imageSheet={},
		sequenceData={}
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
		createSpawningMole.create()
		--then
		assert.spy(generateMolePosition.generate).was_called()
	end)

	it("Should create display sprite with data from mole sprite", function ( ... )
		--given
		spy.on(display, "newSprite")
		--when
		createSpawningMole.create()
		--then
		assert.spy(display.newSprite).was_called_with(moleSpriteMetaData.imageSheet,
		 	moleSpriteMetaData.sequenceData)
	end)

	it("Should set randomed position to spawning mole", function ( ... )
		--when
		local result = createSpawningMole.create()
		--then
		assert.are.equal(result.sprite.x, generated_x)
		assert.are.equal(result.sprite.y, generated_y)
	end)

	it("Should set spawning mole scale to 1.5", function ( ... )
		local result = createSpawningMole.create()
		--then
		assert.are.equal(result.sprite.xScale, 1.5)
		assert.are.equal(result.sprite.yScale, 1.5)
	end)
end)