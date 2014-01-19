describe("Score increment spec", function ( ... )

	local scoreIncrement = require "scoreIncrement"

	scoreTxt = {}

	it("Increase score", function ( ... )
		--given
		score = 0
		--when
		scoreIncrement.increaseScore(20)
		--then
		assert.are.equal(score, 20)
	end)

	it("Set score text with updated score", function ( ... )
		--given
		score = 0
		--when
		scoreIncrement.increaseScore(20)
		--then
		assert.are.same("Score: 20", scoreTxt.text)
	end)
end)