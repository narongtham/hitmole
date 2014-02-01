switchToIdlingMole = {}

terminateMole = terminateMole or require "terminateMole"
escapeMole = escapeMole or require("escapeMole")
getTimeToLive = getTimeToLive or require("getTimeToLive")

function switchToIdlingMole.evaluate( sprite )
	sprite:setSequence( "idle" )
	sprite:play( )
	sprite:addEventListener( "tap", switchToIdlingMole.onTapMole )

	local timeToLive = getTimeToLive.evaluate()

	sprite.transition = transition.to(sprite,
	 {time=timeToLive, x=sprite.x, y=sprite.y, onComplete=switchToIdlingMole.onTimeToLiveExeed })
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