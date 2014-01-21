local escapingMoleSpriteAnimateEnded = escapingMoleSpriteAnimateEnded or require "escapingMoleSpriteAnimateEnded"

switchToEscapingMole = {}

function switchToEscapingMole.evaluate(sprite)
	sprite:setSequence( "escape" )
	sprite:play( )
	sprite:addEventListener( "sprite", switchToEscapingMole.spriteEventHandler )
end

function switchToEscapingMole.spriteEventHandler(event)
	if event.phase == "ended" then
		event.target:removeEventListener( "sprite", switchToEscapingMole.spriteEventHandler )
		escapingMoleSpriteAnimateEnded.evaluate(event.target)
	end
end

return switchToEscapingMole