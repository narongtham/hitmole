showGameOverPopup = showGameOverPopup or require "showGameOverPopup"

checkGameOver = {}

function checkGameOver.evaluate()
	if escapeCount == 0 then
		showGameOverPopup.show()
	end
end

return checkGameOver