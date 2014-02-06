describe("setHighScore", function ( ... )
	local setHighScore

	setup(function ( ... )
		setHighScore = require("setHighScore")
	end)

	it("Set given score to highscore value", function ( ... )
		-- given
		highScore = {
			value = 100
		}
		local score = 110
		-- when
		setHighScore.evaluate(score)
		-- then
		assert.are.equal(score, highScore.value)
	end)
end)