describe("delayAfterSpriteAnimateEnded spec", function ( ... )

	local delayAfterSpriteAnimateEnded = require "delayAfterSpriteAnimateEnded"
	local sprite
	local event = {
			phase="ended",
			target = sprite
	}
	local afterAnimateEndedFunctions = {
		function_1 =  function( ... ) end
	}
	
	timer = {}
	transition = {}

	setup(function ( ... )
		moleContainer = {}
		sprite = {}
		event = {
			phase="ended",
			target = sprite
		}
		stub(timer, "performWithDelay")
		stub(sprite, "removeEventListener")
		stub(transition, "to")
	end)

	it("It should set timer to delay removing mole", function ( ... )
		--when
		delayAfterSpriteAnimateEnded.start(sprite)
		--then
		assert.stub(timer.performWithDelay).was_called_with(300, delayAfterSpriteAnimateEnded.onDelayEnded)
	end)

	it("It should set sprite to waitForRemoveSprite", function ( ... )
		--when
		delayAfterSpriteAnimateEnded.start(sprite)
		--then
		assert.are.same(delayAfterSpriteAnimateEnded.waitForRemoveSprite, sprite)
	end)

	it("It should set provided functions will be execute after delay end", function ( ... )
		--when
		delayAfterSpriteAnimateEnded.start(sprite, afterAnimateEndedFunctions.function_1)
		--then
		assert.are.same(delayAfterSpriteAnimateEnded.afterDelayEndedFunctions, afterAnimateEndedFunctions.function_1)
	end)

	it("When delay ended it start fading out transition", function ( ... )
		--given
		delayAfterSpriteAnimateEnded.waitForRemoveSprite = sprite
		delayAfterSpriteAnimateEnded.afterDelayEndedFunctions = afterAnimateEndedFunctions.function_1
		--when
		delayAfterSpriteAnimateEnded.onDelayEnded(event)
		--then
		assert.stub(transition.to).was_called_with(delayAfterSpriteAnimateEnded.waitForRemoveSprite,
		 {alpha=0, time=300, onComplete=delayAfterSpriteAnimateEnded.onFadeOutCompleted})
	end)

	it("When delay ended it should call after animate ended provided function", function ( ... )
		--given
		delayAfterSpriteAnimateEnded.waitForRemoveSprite = sprite
		stub(afterAnimateEndedFunctions, "function_1")
		delayAfterSpriteAnimateEnded.afterDelayEndedFunctions = afterAnimateEndedFunctions.function_1
		--when
		delayAfterSpriteAnimateEnded.onDelayEnded(event)
		--then
		assert.stub(afterAnimateEndedFunctions.function_1).was_called()
	end)

	it("When fadeout ended. It should remove sprite from display", function ( ... )
		--given
		stub(display, "remove")
		--when
		delayAfterSpriteAnimateEnded.onFadeOutCompleted(sprite)
		--then
		assert.stub(display.remove).was_called_with(sprite)
	end)
end)