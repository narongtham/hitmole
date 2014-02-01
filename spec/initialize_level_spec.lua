describe("initializeLevel", function ( ... )
	local initializeLevel

	setup(function ( ... )
		initializeLevel = require("initializeLevel")
	end)

	it("Set current level config to the first level config", function ( ... )
		-- given
		currentLevelConfig = {}

		local level_1st = {}
		levelConfigurations = {
			level_1st
		}
		-- when
		initializeLevel.evaluate()
		--then
		assert.are.equal(currentLevelConfig, level_1st)
	end)
end)