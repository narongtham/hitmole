spawningMoleSpriteEventHandler = spawningMoleSpriteEventHandler or require 'spawningMoleSpriteEventHandler'

switchToSpawningMole = {}

function switchToSpawningMole.evaluate( sprite )
	sprite:setSequence( "spawn" )
	sprite:play()
	sprite:addEventListener( "sprite", spawningMoleSpriteEventHandler.onSpriteEvent )
end

return switchToSpawningMole
