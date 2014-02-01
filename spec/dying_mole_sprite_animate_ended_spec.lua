describe("dyingMoleSpriteAnimateEnded spec", function ( ... )

	local dyingMoleSpriteAnimateEnded
	local delayAfterSpriteAnimateEnded = require "delayAfterSpriteAnimateEnded"
	local scoreIncrement = require "scoreIncrement"
	local sprite = {}

	setup(function ( ... )
		stub(delayAfterSpriteAnimateEnded, "start")
		stub(scoreIncrement, "increaseScore")

		checkNextLevel = {}
		stub(checkNextLevel, "evaluate")

		dyingMoleSpriteAnimateEnded = require "dyingMoleSpriteAnimateEnded"
	end)

	teardown(function ( ... )
		delayAfterSpriteAnimateEnded.start:revert()
		scoreIncrement.increaseScore:revert()
	end)

	it("Call delayAfterSpriteAnimateEnded.start() with provided functions", function ( ... )
		--when
		dyingMoleSpriteAnimateEnded.evaluate(sprite)
		--then
		assert.stub(delayAfterSpriteAnimateEnded.start).was_called_with(sprite, dyingMoleSpriteAnimateEnded.afterDelayEnded)
	end)

	it("After delay ended function should call score increment", function ( ... )
		--when
		dyingMoleSpriteAnimateEnded.afterDelayEnded()
		--then
		assert.stub(scoreIncrement.increaseScore).was_called_with(20)
	end)

	it("After delay ended function should evaluate checkNextLevel", function ( ... )
		--when
		dyingMoleSpriteAnimateEnded.afterDelayEnded()
		--then
		assert.stub(checkNextLevel.evaluate).was_called()
	end)
end)