describe("getMoleLimit", function ( ... )
	local getMoleLimit = require("getMoleLimit")

	it("Should always return 2", function ( ... )
		-- when
		local moleLimit = getMoleLimit.evaluate()
		-- then
		assert.are.equal(moleLimit, 2)
	end)
end)