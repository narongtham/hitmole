local switchToDyingMole = switchToDyingMole or require("switchToDyingMole")

local switchToIdlingMole = {}

function switchToIdlingMole.evaluate( sprite )
	sprite:setSequence( "idle" )
	sprite:play( )
	sprite:addEventListener( "tap", switchToIdlingMole.onTapMole )
end

function switchToIdlingMole.onTapMole( event )
	event.target:removeEventListener( "tap", switchToIdlingMole.onTapMole )
	audio.play( tapSound, {channel=2, loops=0})
	score = score + 20
	scoreTxt.text = "Score: " .. score
	switchToDyingMole.evaluate(event.target)
end

return switchToIdlingMole