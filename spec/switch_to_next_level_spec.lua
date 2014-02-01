describe("switchToNextLevel", function ( ... )
	local switchToNextLevel

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

		switchToNextLevel = require("switchToNextLevel")
	end)

	before_each(function ( ... )
		currentLevelConfig = level_config_1
	end)

	it("Evaluate getCurrentLevelConfig", function ( ... )
		-- when
		switchToNextLevel.evaluate()
		-- then
		assert.spy(getCurrentLevelConfig.evaluate).was_called()
	end)

	it("Assign next level configuration to currentLevelConfig", function ( ... )
		-- when
		switchToNextLevel.evaluate()
		-- then
		assert.are.equal(currentLevelConfig, level_config_2)
	end)
end)