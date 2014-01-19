describe("Create spawning mole spec", function ( ... )
	local createSpawningMole = require("createSpawningMole")

	display = require('spec.corona-busted.mocks.mockDisplay')
	
	display.newSpritre = function ( ... )
		return {}
	end

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

	switchToSpawningMole = {}
	stub(switchToSpawningMole, "evaluate")

	
	
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
end)