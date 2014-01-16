local switchToDyingMole = {}

function switchToDyingMole.evaluate(sprite)
	sprite:setSequence( "dead" )
	sprite:play( )
end

return switchToDyingMole