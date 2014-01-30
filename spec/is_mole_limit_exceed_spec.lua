describe("isMoleLimitExceed", function ( ... )
	local isMoleLimitExceed

	local fakeMoleLimit = 2
	local fakeMolesCount = 1

	setup(function ( ... )
		getMoleLimit = {
			evaluate = function( ... )
				return fakeMoleLimit
			end
		}
		countMoles = {
			evaluate = function ( ... )
				return fakeMolesCount
			end
		}

		spy.on(getMoleLimit, "evaluate")
		spy.on(countMoles, "evaluate")

		isMoleLimitExceed = require("isMoleLimitExceed")
	end)

	it("Should evaluate getMoleLimit", function ( ... )
		-- when
		isMoleLimitExceed.evaluate()
		-- then
		assert.spy(getMoleLimit.evaluate).was_called()
	end)

	it("Should evaluate countMoles", function ( ... )
		-- when
		isMoleLimitExceed.evaluate()
		-- then
		assert.spy(countMoles.evaluate).was_called()
	end)

	it("if moleLimit equals to moles count and, it should throw an error", function ( ... )
		-- given
		fakeMoleLimit = 2
		fakeMolesCount = 2
		-- when&then
		assert.has_error(isMoleLimitExceed.evaluate, "Mole limit exceeded")
	end)
end)