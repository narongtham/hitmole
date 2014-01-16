local switchToDyingMole = {}

function switchToDyingMole.evaluate(sprite)
	sprite:setSequence( "dead" )
end

return switchToDyingMole