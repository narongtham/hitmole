describe("saveHighScore", function ( ... )
	local saveHighScore

	setup(function ( ... )

		highScore = {}

		saveTable = {}
		stub(saveTable, "evaluate")

		saveHighScore = require("saveHighScore")
	end)

	it("Evaluate saveTable with proper arguments", function ( ... )
		-- when
		saveHighScore.evaluate()
		-- then
		assert.stub(saveTable.evaluate).was_called_with(highScore, "cvm_highscore")
	end)
end)