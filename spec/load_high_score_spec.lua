describe("loadHighScore", function ( ... )
	local loadHighScore

	setup(function ( ... )

		loadHighScoreFile = {}
		stub(loadHighScoreFile, "evaluate")

		loadHighScore = require("loadHighScore")
	end)

	it("Evaluate loadHighScoreFile", function ( ... )
		-- when
		loadHighScore.evaluate()
		-- then
		assert.stub(loadHighScoreFile.evaluate).was_called()
	end)

	it("If file available replace highScore table with data in the file")

	it("If file not available then set 0 to highscore")
end)