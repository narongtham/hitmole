--createSpawningMole = createSpawningMole or require("createSpawningMole")

switchToDyingMole = {}

function switchToDyingMole.evaluate(sprite)
	sprite:setSequence( "dead" )
	sprite:play( )
	sprite:addEventListener( "sprite", switchToDyingMole.spriteEventHandler )
end

function switchToDyingMole.spriteEventHandler(event)
	if event.phase == "ended" then
		event.target:removeEventListener( "sprite", switchToDyingMole.spriteEventHandler )
		switchToDyingMole.waitForRemoveSprite = event.target
		timer.performWithDelay( 300, switchToDyingMole.removeMoleSprite )
	end
end

function switchToDyingMole.removeMoleSprite()
	display.remove(switchToDyingMole.waitForRemoveSprite)
	mole = createSpawningMole.create()
end

return switchToDyingMole