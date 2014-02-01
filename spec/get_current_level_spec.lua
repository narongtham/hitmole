describe("getCurrentLevel", function ( ... )
	local getCurrentLevelConfig

	setup(function ( ... )
		getCurrentLevelConfig = require("getCurrentLevelConfig")
	end)

	it("return current level", function ( ... )
		curretLevelConfig = {}
		-- when
		local levelConfig = getCurrentLevelConfig.evaluate()
		-- then
		assert.are.same(levelConfig, curretLevelConfig)
	end)
end)