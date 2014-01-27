describe("pauseAllMoles", function ( ... )

	local mole_1 = {}
	local mole_2 = {}

	local pauseAllMoles

	setup(function ( ... )
		moleContainer = { 
			[mole_1] = true ,
			[mole_2] = true
		}

		stub(mole_1, "pause")
		stub(mole_2, "pause")

		pauseAllMoles = require "pauseAllMoles"
	end)

	it("Call pause on every mole in container", function ( ... )
		-- when
		pauseAllMoles.evaluate()
		-- then
		assert.stub(mole_1.pause).was_called_with(mole_1)
		assert.stub(mole_2.pause).was_called_with(mole_2)
	end)
end)