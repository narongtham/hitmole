describe("Create spawning mole spec", function ( ... )

	local addMoleToContainer = require "addMoleToContainer"

	local createSpawningMole = require("createSpawningMole")

	display = nil

	-- local display = {		
	-- 	newSpritre = function ( ... )
	-- 		print( "Create mole" )
	-- 		return {}
	-- 	end
	-- }

	currentViewGroup = {
		insert = function ( ... ) end
	}

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
	local moleSprite = {}

	setup(function ( ... )
		display.newSprite = function ( ... )
			return moleSprite
		end

		stub(addMoleToContainer, "add")
	end)

	teardown(function ( ... )
		addMoleToContainer.add:revert()
	end)
	
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

	it("Should insert moleSprite to currentViewGroup", function ( ... )
		-- given
		stub(currentViewGroup, "insert")
		--when
		createSpawningMole.create()
		--then
		assert.stub(currentViewGroup.insert).was_called_with(currentViewGroup, moleSprite)
	end)

	it("Should call addMoleToContainer", function ( ... )
		-- when
		createSpawningMole.create()
		-- then
		assert.stub(addMoleToContainer.add).was_called_with(moleSprite)
	end)
end)