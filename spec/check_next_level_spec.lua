describe("checkNextLevel", function ( ... )
	local checkNextLevel
	local fakeNextLevelScore = 200

	score = 0

	setup(function ( ... )
		getNextLevelScore = {
			evaluate = function ( ... )
				return fakeNextLevelScore
			end
		}
		spy.on(getNextLevelScore, "evaluate")

		switchToNextLevel = {}
		stub(switchToNextLevel, "evaluate")

		hasNextLevel = {
			evaluate = function ( ... )
				-- body
			end
		}
		spy.on(hasNextLevel, "evaluate")

		checkNextLevel = require("checkNextLevel")
	end)

	it("Evaluate hasNextLevel", function ( ... )
		-- when
		checkNextLevel.evaluate()
		-- then
		assert.spy(hasNextLevel.evaluate).was_called()
	end)

	it("Get nextLevelScore from currentLevelConfig", function ( ... )
		-- when
		checkNextLevel.evaluate()
		-- then
		assert.stub(getNextLevelScore.evaluate).was_called()
	end)

	it("If score equal or greater than nextLevelScore then evaluate swithToNextLevel", function ( ... )
		-- given
		score = 200
		-- when
		checkNextLevel.evaluate()
		-- then
		assert.stub(switchToNextLevel.evaluate).was_called()
	end)

end)