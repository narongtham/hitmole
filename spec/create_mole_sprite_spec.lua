describe("CreateMoleSprite spec", function ( ... )
	graphics = require("spec.corona-busted.mocks.mockGraphics")
	createMoleSprite = require("createMoleSprite")
	options = {width = 200, height = 170, numFrames = 67}

	it("It should construct mole image sheet", function ( ... )
		--Given
		local spyOnGraphics = spy.on(graphics, "newImageSheet")
		--When
		createMoleSprite.create()
		--Then
		assert.spy(graphics.newImageSheet).was_called_with("img/sprite/mole1.png", options)
	end)

	it("Result should contains imageSheet", function ( ... )
		--When
		local result = createMoleSprite.create()
		--Then
		assert.are.same(result.imageSheet, graphics.newImageSheet("img/sprite/mole1.png", options))
	end)

	it("Result should contains spawning sequence data", function ( ... )
		--Given
		local spawningSequenceData = {name="spawn", start=1, count=55, time=2000 , loopCount=1}
		--When
		local result = createMoleSprite.create()
		--Then
		assert.are.same(result.sequenceData[1], spawningSequenceData)
	end)

	it("Result should contains idling sequence data", function ( ... )
		--Given
		local idlingSequenceData = {name="idle", start=55, count=2, loopCount=0}
		--When
		local result = createMoleSprite.create()
		--Then
		assert.are.same(result.sequenceData[2], idlingSequenceData)
	end)

	it("Result should contains leaving sequence data", function ( ... )
		--Given
		local leavingSequenceData = {name="leave", frames={55,54,53,52,51,50,49,48,47,46}, loopCount=1, time=300}
		--When
		local result = createMoleSprite.create()
		--Then
		assert.are.same(result.sequenceData[3], leavingSequenceData)
	end)

	it("Result should contains dying sequence data", function ( ... )
		--Given
		local dyingSequenceData = {name="dead", start=56, count=12, time=300 , loopCount=1}
		--When
		local result = createMoleSprite.create()
		--Then
		assert.are.same(result.sequenceData[4], dyingSequenceData)
	end)
end)