local createSpawningMole = require("createSpawningMole")
local switchToEscapingMole = {}

function switchToEscapingMole.evaluate(sprite)
	sprite:setSequence( "escape" )
	sprite:play( )
	sprite:addEventListener( "sprite", switchToEscapingMole.spriteEventHandler )
end

function switchToEscapingMole.spriteEventHandler(event)
	if event.phase == "ended" then
		event.target:removeEventListener( "sprite", switchToEscapingMole.spriteEventHandler )
		switchToEscapingMole.waitForRemoveSprite = event.target
		timer.performWithDelay( 300, switchToEscapingMole.removeMoleSprite )
	end
end

function switchToEscapingMole.removeMoleSprite()
	display.remove(switchToEscapingMole.waitForRemoveSprite)
	createSpawningMole.create()
end

return switchToEscapingMole