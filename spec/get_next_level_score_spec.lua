describe("getNextLevelScore", function ( ... )
	local getNextLevelScore
	local currentLevelConfig

	setup(function ( ... )

		currentLevelConfig = {
			nextLevelScore = 200
		}

		getCurrentLevelConfig = {
			evaluate = function ( ... )
				return currentLevelConfig
			end
		}

		spy.on(getCurrentLevelConfig, "evaluate")

		getNextLevelScore = require("getNextLevelScore")
	end)

	it("Should evaluate getCurrentLevelConfig", function ( ... )
		-- when
		getNextLevelScore.evaluate()
		-- then
		assert.spy(getCurrentLevelConfig.evaluate).was_called()
	end)

	it("Should return moleLimit value from currentLevelConfig", function ( ... )
		-- when
		local nextLevelScore = getNextLevelScore.evaluate()
		-- then
		assert.are.equal(200, nextLevelScore)
	end)
end)