local switchToDyingMole = switchToDyingMole or require("switchToDyingMole")

local switchToIdlingMole = {}

function switchToIdlingMole.evaluate( sprite )
	sprite:setSequence( "idle" )
	sprite:play( )
	sprite:addEventListener( "tap", switchToIdlingMole.onTapMole )
	sprite.transition = transition.to(sprite,
	 {time=3000, x=sprite.x, y=sprite.y, onComplete=switchToIdlingMole.onTimeToLiveExeed })
end

function switchToIdlingMole.onTapMole( event )
	event.target:removeEventListener( "tap", switchToIdlingMole.onTapMole )
	audio.play( tapSound, {channel=2, loops=0})
	score = score + 20
	scoreTxt.text = "Score: " .. score
	switchToDyingMole.evaluate(event.target)
end

function switchToIdlingMole.onTimeToLiveExeed( target )
	target:removeEventListener( "tap", switchToIdlingMole.onTapMole )
	print( "Mole time to live exceeded." )
end

return switchToIdlingMole