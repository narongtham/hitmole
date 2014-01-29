describe("cancelGenerateMoleTimer", function ( ... )
	local cancelGenerateMoleTimer

	timer = {}

	setup(function ( ... )
		generateMoleTimer = {}
		stub(timer, "cancel")

		cancelGenerateMoleTimer = require("cancelGenerateMoleTimer")
	end	)

	it("Call timer for current generate mole timer", function ( ... )
		-- when
		cancelGenerateMoleTimer.evaluate()
		-- then
		assert.stub(timer.cancel).was_called_with(generateMoleTimer)
	end)
end)