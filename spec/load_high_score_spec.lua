describe("loadHighScore", function ( ... )
	local loadHighScore

	local stored_highScore = {
		value = 9999
	}

	setup(function ( ... )

		loadHighScoreFile = {
			evaluate = function ( ... )
				return stored_highScore
			end
		}
		spy.on(loadHighScoreFile, "evaluate")

		loadHighScore = require("loadHighScore")
	end)

	it("Evaluate loadHighScoreFile", function ( ... )
		-- when
		loadHighScore.evaluate()
		-- then
		assert.stub(loadHighScoreFile.evaluate).was_called()
	end)

	it("If file available replace highScore table with data in the file", function ( ... )
		-- when
		loadHighScore.evaluate()
		-- then
		assert.are.same(highScore, stored_highScore)
	end)

end)