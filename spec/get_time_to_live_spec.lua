describe("getTimeToLive", function ( ... )
	local getTimeToLive

	setup(function ( ... )
		currentLevelConfig = {
			timeToLive = 3000
		}

		getCurrentLevelConfig = {
			evaluate = function ( ... )
				return currentLevelConfig
			end
		}
		spy.on(getCurrentLevelConfig, "evaluate")

		getTimeToLive = require("getTimeToLive")
	end)

	it("Evaluate getCurrentLevelConfig", function ( ... )
		-- when
		getTimeToLive.evaluate()
		-- then
		assert.spy(getCurrentLevelConfig.evaluate).was_called()
	end)

	it("return timeToLive value value from currentLevelConfig", function ( ... )
		-- when
		local timeToLive = getTimeToLive.evaluate()
		-- then
		assert.are.equal(timeToLive, currentLevelConfig.timeToLive)
	end)
end)