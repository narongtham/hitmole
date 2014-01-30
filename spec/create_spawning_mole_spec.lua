describe("Create spawning mole spec", function ( ... )

	local addMoleToContainer = require "addMoleToContainer"

	local createSpawningMole = require("createSpawningMole")

	display = nil

	currentViewGroup = {
		insert = function ( ... ) end
	}

	generated_x = 10
	generated_y = 20
	generatedMolePosition = {
		x=generated_x,
	 	y=generated_y
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
		local spawningMole = createSpawningMole.create(generatedMolePosition)
		--then
		assert.are_not.Nil(spawningMole)
	end)

	it("Should create display sprite with data from mole sprite", function ( ... )
		--given
		spy.on(display, "newSprite")
		--when
		createSpawningMole.create(generatedMolePosition)
		--then
		assert.spy(display.newSprite).was_called_with(moleSpriteMetaData.imageSheet,
		 	moleSpriteMetaData.sequenceData)
	end)

	it("Should insert moleSprite to currentViewGroup", function ( ... )
		-- given
		stub(currentViewGroup, "insert")
		--when
		createSpawningMole.create(generatedMolePosition)
		--then
		assert.stub(currentViewGroup.insert).was_called_with(currentViewGroup, moleSprite)
	end)

	it("Should call addMoleToContainer", function ( ... )
		-- when
		createSpawningMole.create(generatedMolePosition)
		-- then
		assert.stub(addMoleToContainer.add).was_called_with(moleSprite)
	end)
end)