describe("getMoleLimit", function ( ... )
	local getMoleLimit

	setup(function ( ... )

		getCurrentLevelConfig = {
			evaluate = function ( ... )
				-- body
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

	it("Should always return 2", function ( ... )
		-- when
		local moleLimit = getMoleLimit.evaluate()
		-- then
		assert.are.equal(moleLimit, 2)
	end)
end)