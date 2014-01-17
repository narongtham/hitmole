local switchToDyingMole = {}

function switchToDyingMole.evaluate(sprite)
	sprite:setSequence( "dead" )
	sprite:play( )
	sprite:addEventListener( "sprite", switchToDyingMole.spriteEventHandler )
end

function switchToDyingMole.spriteEventHandler(event)
	if event.phase == "ended" then
		display.remove(event.target)
	end
end

return switchToDyingMole