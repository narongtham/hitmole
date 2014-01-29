describe("cleanupGameState", function ( ... )
	local cleanupGameState

	local removeAllLifepoints = require("removeAllLifepoints")

	setup(function ( ... )
		stub(removeAllLifepoints, "evaluate")
		cleanupGameState = require("cleanupGameState")
	end)

	teardown(function ( ... )
		removeAllLifepoints.evaluate:revert()
	end)

	it("Should call removeAllLifepoints", function ( ... )
		-- when
		cleanupGameState.evaluate()
		-- then
		assert.stub(removeAllLifepoints.evaluate).was_called()
	end)

	it("Should call removeAllMoles")

	it("Should call cancelGenerateMoletimer")
end)