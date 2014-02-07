describe("checkHighScore", function ( ... )
	local checkHighScore

	local fakeHighScore = 0
	
	local group = {}

	setup(function ( ... )

		score = 100

		getHighScore = {
			evaluate = function ( ... )
				return fakeHighScore
			end
		}
		spy.on(getHighScore, "evaluate")

		setHighScore = {}
		stub(setHighScore, "evaluate")

		saveHighScore = {}
		stub(saveHighScore, "evaluate")

		showNewHighBadge = {}
		stub(showNewHighBadge, "evaluate")

		showHighScoreText = {}
		stub(showHighScoreText, "evaluate")

		checkHighScore = require("checkHighScore")
	end)

	it("Evalaute getHighScore", function ( ... )
		-- when
		checkHighScore.evaluate(group)
		-- then
		assert.stub(getHighScore.evaluate).was_called()
	end)

	it("If current score higher than highScore.value then evaluate setHighscore", function ( ... )
		-- when
		checkHighScore.evaluate(group)
		-- then
		assert.stub(setHighScore.evaluate).was_called_with(score)
	end)

	it("If current score higher than highscore then save", function ( ... )
		-- when
		checkHighScore.evaluate(group)
		-- then
		assert.stub(saveHighScore.evaluate).was_called()
	end)

	it("If current score higher than highscore then show new badge", function ( ... )
		-- when
		checkHighScore.evaluate(group)
		-- then
		assert.stub(showNewHighBadge.evaluate).was_called()
	end)

	it("Show highScore text", function ( ... )
		-- when
		checkHighScore.evaluate(group)
		-- then
		assert.stub(showHighScoreText.evaluate).was_called_with(group)
	end)
end)