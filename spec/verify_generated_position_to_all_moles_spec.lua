describe("verifyGeneratedPositionToAllMoles", function ( ... )
	local verifyGeneratedPositionToAllMoles

	setup(function ( ... )
		verifyMoleRegion = {}
		stub(verifyMoleRegion, "evaluate")

		verifyGeneratedPositionToAllMoles = require("verifyGeneratedPositionToAllMoles")
	end)

	it("verify position on each mole in container", function ( ... )
		-- given
		local generatedPosition = {}
		local mole_1 = {}
		local mole_2 = {}
		moleContainer = {
			[mole_1] = true,
			[mole_2] = true
		}
		--when
		verifyGeneratedPositionToAllMoles.evaluate(generatedPosition)
		--then
		assert.stub(verifyMoleRegion.evaluate).was_called_with(generatedPosition, mole_1)
		assert.stub(verifyMoleRegion.evaluate).was_called_with(generatedPosition, mole_2)
	end)
end)