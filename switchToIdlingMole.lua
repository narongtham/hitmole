local switchToDyingMole = switchToDyingMole or require("switchToDyingMole")

local switchToIdlingMole = {}

function switchToIdlingMole.evaluate( sprite )
	sprite:setSequence( "idle" )
	sprite:play( )
	sprite:addEventListener( "tap", switchToIdlingMole.onTapMole )
end

function switchToIdlingMole.onTapMole( event )
	switchToDyingMole.evaluate(event.target)
end

return switchToIdlingMole