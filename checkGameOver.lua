--local createSpawnMole = createSpawnMole or require "createSpawnMole"
checkGameOver = {}

function checkGameOver.evaluate()
	if escapeCount > 0 then
		createSpawningMole.create()
	else
		local gameOverText = display.newText( "GameOver",0,0,"Helvetica",50 )
		gameOverText:setFillColor( 0,0,0.2 )
		gameOverText.x = DISPLAY_CENTER_X
		gameOverText.y = DISPLAY_CENTER_Y
	end
end

return checkGameOver