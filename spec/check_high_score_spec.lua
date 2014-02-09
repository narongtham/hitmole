describe("checkHighScore", function ( ... )
	local checkHighScore

	local fakeHighScore = 0
	
	local group = {}

	local highScoreText = {}

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

		showNewHighScoreText = {
			evaluate = function ( ... )
				return highScoreText
			end
		}
		spy.on(showNewHighScoreText, "evaluate")

		showHighScoreText = {
			evaluate = function ( ... )
				return highScoreText
			end
		}
		spy.on(showHighScoreText, "evaluate")

		showGameOverScoreText = {}
		stub(showGameOverScoreText, "evaluate")

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

	it("If current score higher than highscore then show high score with new badge", function ( ... )
		-- when
		checkHighScore.evaluate(group)
		-- then
		assert.stub(showNewHighScoreText.evaluate).was_called_with(group)
	end)

	it("If current score lower or equal then just show highScore text", function ( ... )
		-- given
		score = 20
		fakeHighScore = 100
		-- when
		checkHighScore.evaluate(group)
		-- then
		assert.stub(showHighScoreText.evaluate).was_called_with(group)
	end)

	it("Evaluate showGameOverScoreText", function ( ... )
		-- when
		checkHighScore.evaluate(group)
		-- theb
		assert.stub(showGameOverScoreText.evaluate).was_called_with(group, highScoreText)
	end)
end)