switchToIdlingMole =  switchToIdlingMole or require 'switchToIdlingMole'

spawningMoleSpriteEventHandler = {}

function spawningMoleSpriteEventHandler.onSpriteEvent(event)
	if event.phase == "ended" then
		event.target:removeEventListener( "sprite", spawningMoleSpriteEventHandler.onSpriteEvent )
		switchToIdlingMole.evaluate(event.target)
	end
end

return spawningMoleSpriteEventHandler