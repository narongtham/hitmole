terminateMole = terminateMole or require "terminateMole"
escapeMole = escapeMole or require("escapeMole")

switchToIdlingMole = {}

function switchToIdlingMole.evaluate( sprite )
	sprite:setSequence( "idle" )
	sprite:play( )
	sprite:addEventListener( "tap", switchToIdlingMole.onTapMole )
	sprite.transition = transition.to(sprite,
	 {time=3000, x=sprite.x, y=sprite.y, onComplete=switchToIdlingMole.onTimeToLiveExeed })
	sprite.removeAllEventListeners = switchToIdlingMole.removeAllEventListeners
end

function switchToIdlingMole.onTapMole( event )
	switchToIdlingMole.removeAllEventListeners(event.target)
	terminateMole.evaluate(event.target)
	return true
end

function switchToIdlingMole.onTimeToLiveExeed( target )
	switchToIdlingMole.removeAllEventListeners(target)
	escapeMole.evaluate(target)
end

function switchToIdlingMole.removeAllEventListeners(target)
	target:removeEventListener( "tap", switchToIdlingMole.onTapMole )
	transition.cancel(target)
	target.removeAllEventListeners = nil
end

return switchToIdlingMole