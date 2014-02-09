describe("showNewHighScoreText", function ( ... )
	local showNewHighScoreText

	local highScoreText = {}

	local group = {}

	setup(function ( ... )

		showHighScoreText = {
			evaluate = function ( ... )
				return highScoreText
			end
		}
		spy.on(showHighScoreText, "evaluate")

		showNewHighBadge = {}
		stub(showNewHighBadge, "evaluate")

		showNewHighScoreText = require("showNewHighScoreText")
	end)

	it("Evalaute showHighScoreText", function ( ... )
		--when
		showNewHighScoreText.evaluate(group)
		--then
		assert.stub(showHighScoreText.evaluate).was_called_with(group)
	end)

	it("Evaluate showNewHighBadge with highScoreText", function ( ... )
		-- when
		showNewHighScoreText.evaluate(group)
		-- then
		assert.stub(showNewHighBadge.evaluate).was_called_with(group, highScoreText)
	end)

	it("Return highScoreText", function ( ... )
		-- when
		local result = showNewHighScoreText.evaluate(group)
		--then
		assert.are.equal(result, highScoreText)
	end)
end)