describe("onGenerateMoleTimerEnded", function ( ... )

	local onGenerateMoleTimerEnded

	local fakeGeneratedMolePosition

	setup(function ( ... )

		fakeGeneratedMolePosition = {}

		generateMolePosition = {
			generate = function ( ... )
				return fakeGeneratedMolePosition
			end
		}

		createSpawningMole = {
			create = function ( ... )
				-- body
			end
		}

		startGenerateMoleTimer = {}

		spy.on(generateMolePosition, "generate")
		spy.on(createSpawningMole, "create")
		stub(startGenerateMoleTimer, "evaluate")

		onGenerateMoleTimerEnded = require("onGenerateMoleTimerEnded")
	end)

	teardown(function ( ... )
		startGenerateMoleTimer.evaluate:revert()
	end)

	it("Call generateMolePosition", function ( ... )
		-- when
		onGenerateMoleTimerEnded.evaluate()
		-- then
		assert.spy(generateMolePosition.generate).was_called()
	end)

	it("Call createSpawnMole", function ( ... )
		-- when
		onGenerateMoleTimerEnded.evaluate()
		-- then
		assert.spy(createSpawningMole.create).was_called_with(fakeGeneratedMolePosition)
	end)

	it("onTimer should call evaluate again", function ( ... )
		-- when
		onGenerateMoleTimerEnded.evaluate()
		--then
		assert.stub(startGenerateMoleTimer.evaluate).was_called()
	end)
end)