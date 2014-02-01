describe("hasNextLevel", function ( ... )
	local hasNextLevel

	local currentLevelConfig = {
		level = 1
	}

	local level_config_1 = {
		level = 1
	}
	local level_config_2 = {
		level = 2
	}
	
	setup(function ( ... )

		getCurrentLevelConfig = {
			evaluate = function ( ... )
				return currentLevelConfig
			end
		}
		spy.on(getCurrentLevelConfig, "evaluate")

		levelConfigurations = {
			level_config_1,
			level_config_2
		}

		hasNextLevel = require("hasNextLevel")
	end)

	it("Evaluate getCurrentLevelConfig", function ( ... )
		-- when
		hasNextLevel.evaluate()
		-- then
		assert.stub(getCurrentLevelConfig.evaluate).was_called()
	end)

	it("Throw error when there are no next level", function ( ... )
		-- given
		currentLevelConfig = level_config_2
		-- when then
		assert.has_error(hasNextLevel.evaluate, "No next level")
	end)

	it("Not throw error when there are next level available", function ( ... )
		currentLevelConfig = level_config_1
		-- when then
		assert.has_no_error(hasNextLevel.evaluate, "No next level")
	end)
end)