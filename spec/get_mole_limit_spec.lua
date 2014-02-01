describe("getMoleLimit", function ( ... )
	local getMoleLimit
	local currentLevelConfig

	setup(function ( ... )

		currentLevelConfig = {
			moleLimit = 1
		}

		getCurrentLevelConfig = {
			evaluate = function ( ... )
				return currentLevelConfig
			end
		}
		spy.on(getCurrentLevelConfig, "evaluate")

		getMoleLimit = require("getMoleLimit")
	end)

	it("Should evaluate getCurrentLevelConfig", function ( ... )
		-- when
		moleLimit = getMoleLimit.evaluate()
		-- then
		assert.spy(getCurrentLevelConfig.evaluate).was_called()
	end)

	it("Should return moleLimit value from currentLevelConfig", function ( ... )
		--given
		--currentLevelConfig.moleLimit = 5
		-- when
		local moleLimit = getMoleLimit.evaluate()
		-- then
		assert.are.equal(1, moleLimit)
	end)
end)