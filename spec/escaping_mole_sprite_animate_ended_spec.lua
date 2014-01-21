describe("escapingMoleSpriteAnimateEnded", function ( ... )
	
	local escapingMoleSpriteAnimateEnded = require "escapingMoleSpriteAnimateEnded"
	local delayAfterSpriteAnimateEnded = require "delayAfterSpriteAnimateEnded"
	local decreaseLifePoint = require "decreaseLifePoint"
	local checkGameOver = require "checkGameOver"

	local sprite

	setup(function ( ... )
		sprite = {}
		stub(delayAfterSpriteAnimateEnded, "start")
		stub(decreaseLifePoint, "decreaseByOne")
		stub(checkGameOver, "evaluate")
	end)

	teardown(function ( ... )
		delayAfterSpriteAnimateEnded.start:revert()
		decreaseLifePoint.decreaseByOne:revert()
		checkGameOver.evaluate:revert()
	end)

	it("Call delayAfterSpriteAnimateEnded.start() with sprite and provided functions", function ( ... )
		--when
		escapingMoleSpriteAnimateEnded.evaluate(sprite)
		--then
		assert.stub(delayAfterSpriteAnimateEnded.start).was_called_with(sprite, escapingMoleSpriteAnimateEnded.afterDelayEnded)
	end)

	it("Should decrease heart", function ( ... )
		--when
		escapingMoleSpriteAnimateEnded.afterDelayEnded()
		--then
		assert.stub(decreaseLifePoint.decreaseByOne).was_called()
	end)

	it("Should check game over", function ( ... )
		--when
		escapingMoleSpriteAnimateEnded.afterDelayEnded()
		--then
		assert.stub(checkGameOver.evaluate).was_called()
	end)
end)