terminateMole = terminateMole or require "terminatemole"
escapeMole = escapeMole or require("escapeMole")

switchToIdlingMole = {}

function switchToIdlingMole.evaluate( sprite )
	sprite:setSequence( "idle" )
	sprite:play( )
	sprite:addEventListener( "tap", switchToIdlingMole.onTapMole )
	sprite.transition = transition.to(sprite,
	 {time=3000, x=sprite.x, y=sprite.y, onComplete=switchToIdlingMole.onTimeToLiveExeed })
end

function switchToIdlingMole.onTapMole( event )
	switchToIdlingMole.removeAllEventListeners(event.target)
	terminateMole.evaluate(event.target)
end

function switchToIdlingMole.onTimeToLiveExeed( target )
	switchToIdlingMole.removeAllEventListeners(target)
	escapeMole.evaluate(target)
end

function switchToIdlingMole.removeAllEventListeners(target)
	target:removeEventListener( "tap", switchToIdlingMole.onTapMole )
	transition.cancel(target)
end

return switchToIdlingMole