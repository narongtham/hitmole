describe("countMoles", function ( ... )
	local countMoles

	setup(function ( ... )
		moleContainer = {}

		countMoles = require("countMoles")
	end)

	it("Return 0 if no mole in container", function ( ... )
		-- given
		moleContainer = {}
		-- when
		local molesCount = countMoles.evaluate()
		-- then
		assert.are.equal(molesCount, 0)
	end)

	it("Return 1 if it has 1 mole in container", function ( ... )
		-- given
		moleContainer = {
			[{}] = true
		}
		-- when
		local molesCount = countMoles.evaluate()
		-- then
		assert.are.equal(molesCount, 1)
	end)

	it("Return 2 if it has 2 mole in container", function ( ... )
		-- given
		moleContainer = {
			[{}] = true,
			[{}] = true
		}
		-- when
		local molesCount = countMoles.evaluate()
		-- then
		assert.are.equal(molesCount, 2)
	end)
end)