showGameOverPopup = showGameOverPopup or require "showGameOverPopup"
pauseGenerateMoleTimer = pauseGenerateMoleTimer or require "pauseGenerateMoleTimer"

checkGameOver = {}

function checkGameOver.evaluate()
	if escapeCount == 0 then
		pauseGenerateMoleTimer.evaluate()
		showGameOverPopup.show()
	end
end

return checkGameOver