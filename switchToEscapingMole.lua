switchToEscapingMole = {}
createSpawningMole = createSpawningMole or "createSpawningMole"

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

	if escapeCount > 0 then 
		mole = createSpawningMole.create()
	else
		local gameOverTxt = display.newText("GameOver",0,0,"Helvetica",50)
		gameOverTxt:setFillColor( 0,0,0.2 )
		gameOverTxt.x = DISPLAY_CENTER_X
		gameOverTxt.y = DISPLAY_CENTER_Y
	end
end

return switchToEscapingMole