describe("cleanupGameState", function ( ... )
	local cleanupGameState

	local removeAllLifepoints = require("removeAllLifepoints")
	local removeAllMoles = require("removeAllMoles")
	local cancelGenerateMoleTimer = require("cancelGenerateMoleTimer")

	setup(function ( ... )
		stub(removeAllLifepoints, "evaluate")
		stub(removeAllMoles, "evaluate")
		stub(cancelGenerateMoleTimer, "evaluate")
		cleanupGameState = require("cleanupGameState")
	end)

	teardown(function ( ... )
		removeAllLifepoints.evaluate:revert()
		removeAllMoles.evaluate:revert()
		cancelGenerateMoleTimer.evaluate:revert()
	end)

	it("Should call removeAllLifepoints", function ( ... )
		-- when
		cleanupGameState.evaluate()
		-- then
		assert.stub(removeAllLifepoints.evaluate).was_called()
	end)

	it("Should call removeAllMoles", function ( ... )
		-- when
		cleanupGameState.evaluate()
		-- then
		assert.stub(removeAllMoles.evaluate).was_called()
	end)

	it("Should call cancelGenerateMoletimer", function ( ... )
		-- when
		cleanupGameState.evaluate()
		-- then
		assert.stub(cancelGenerateMoleTimer.evaluate).was_called()
	end)
end)