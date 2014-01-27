describe("addMoleToContainer", function ( ... )

	moleContainer = {}

	local addMoleToContainer = require "addMoleToContainer"

	teardown(function ( ... )
		moleContainer = nil
	end)

	it("Insert a given mole to provided container", function ( ... )
		-- given
		local mole = {}
		--when
		addMoleToContainer.add(mole)
		--then
		assert.are.True(moleContainer[mole])
	end)
end)