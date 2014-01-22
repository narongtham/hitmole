--local createSpawnMole = createSpawnMole or require "createSpawnMole"
showGameOverPopup = showGameOverPopup or require "showGameOverPopup"

checkGameOver = {}

function checkGameOver.evaluate()
	if escapeCount > 0 then
		createSpawningMole.create()
	else
		showGameOverPopup.show()
	end
end

return checkGameOver