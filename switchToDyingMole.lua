--createSpawningMole = createSpawningMole or require("createSpawningMole")
require "dyingMoleSpriteAnimateEnded"

switchToDyingMole = {}

function switchToDyingMole.evaluate(sprite)
	sprite:setSequence( "dead" )
	sprite:play( )
	sprite:addEventListener( "sprite", switchToDyingMole.spriteEventHandler )
end

function switchToDyingMole.spriteEventHandler(event)
	if event.phase == "ended" then
		event.target:removeEventListener( "sprite", switchToDyingMole.spriteEventHandler )
		dyingMoleSpriteAnimateEnded.evaluate(event.target)
	end
end

return switchToDyingMole