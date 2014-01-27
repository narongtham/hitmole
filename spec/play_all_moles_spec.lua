describe("playAllMoles", function ( ... )
	local mole_1 = {}
	local mole_2 = {}

	local playAllMoles

	setup(function ( ... )
		moleContainer = { 
			[mole_1] = true ,
			[mole_2] = true
		}

		stub(mole_1, "play")
		stub(mole_2, "play")

		playAllMoles = require "playAllMoles"
	end)

	it("Call play on every mole in container", function ( ... )
		-- when
		playAllMoles.evaluate()
		-- then
		assert.stub(mole_1.play).was_called_with(mole_1)
		assert.stub(mole_2.play).was_called_with(mole_2)
	end)
end)