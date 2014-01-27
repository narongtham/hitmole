describe("removeAllMoles", function ( ... )

	local mole_1 = {}
	local mole_2 = {}

	local removeAllMoles

	setup(function ( ... )
		moleContainer = { 
			[mole_1] = true,
			[mole_2] = true
		}
		display = {}
		stub(display, "remove")

		removeAllMoles = require("removeAllMoles")
	end)

	it("Call display.remove( ) for every moles in container", function ( ... )
		-- when
		removeAllMoles.evaluate()
		-- then
		assert.stub(display.remove).was_called_with(mole_1)
		assert.stub(display.remove).was_called_with(mole_2)
	end)

	it("If any of them have attached removeAllEventListeners then call", function ( ... )
		--given
		mole_3 = {}
		stub(mole_3, "removeAllEventListeners")
		moleContainer[mole_3] = true
		-- when
		removeAllMoles.evaluate()
		-- then
		assert.stub(mole_3.removeAllEventListeners).was_called_with(mole_3)
	end)
end)