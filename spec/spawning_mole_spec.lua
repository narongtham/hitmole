describe("Spawning mole spec", function ( ... )

	graphics = require("spec.corona-busted.mocks.mockGraphics")
	local SpawningMole = require("SpawningMole")

	it("On initializing it should construct mole image sheet", function ( ... )
		--Given
		stub(graphics, "newImageSheet")
		local options = {width = 200, height = 170, numFrames = 67}
		--When
		SpawningMole.new()
		--Then
		assert.stub(graphics.newImageSheet).was_called_with("img/sprite/mole1.png", options)
	end)

	it("On initializing it should have spawning sequence data", function ( ... )
		--Given
		local spawningSequenceData = {name = "spawn", start = 1, count = 55, time = 2000 , loopCount = 1}
		--When
		local spawningMole = SpawningMole.new()
		--Then
		assert.are.same(spawningMole.sequenceData[1], spawningSequenceData)
	end)

	it("On initializing it should have idling sequence data", function ( ... )
		--Given
		local idlingSequenceData = {name = "idle", start = 55, count = 2, loopCount = 0}
		--When
		local spawningMole = SpawningMole.new()
		--Then
		assert.are.same(spawningMole.sequenceData[2], idlingSequenceData)
	end)

	it("On initializing it should have leaving sequence data", function ( ... )
		--Given
		local leavingSequenceData = {name = "leave", frames={55,54,53,52,51,50,49,48,47,46}, loopCount=1, time=300}
		--When
		local spawningMole = SpawningMole.new()
		--Then
		assert.are.same(spawningMole.sequenceData[3], leavingSequenceData)
	end)

	it("On initializing it should have dying sequence data", function ( ... )
		--Given
		local dyingSequenceData = {name = "dead", start = 56, count = 12, time = 300 , loopCount = 1}
		--When
		local spawningMole = SpawningMole.new()
		--Then
		assert.are.same(spawningMole.sequenceData[4], dyingSequenceData)
	end)

	it("When generateMole() called, It should draw spawning mole at given position", function ( ... )
		error("Not yet implemented")
	end)
end)