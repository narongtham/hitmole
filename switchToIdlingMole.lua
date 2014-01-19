terminateMole = terminateMole or require "terminatemole"
switchToEscapingMole = switchToEscapingMole or require("switchToEscapingMole")

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
	display.remove( heart[escapeCount] )
	escapeCount = escapeCount - 1
	switchToEscapingMole.evaluate(target)
end

function switchToIdlingMole.removeAllEventListeners(target)
	target:removeEventListener( "tap", switchToIdlingMole.onTapMole )
	transition.cancel(target)
end

return switchToIdlingMole