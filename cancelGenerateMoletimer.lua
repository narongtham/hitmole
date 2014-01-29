cancelGenerateMoleTimer = {}

function cancelGenerateMoleTimer.evaluate()
	timer.cancel( generateMoleTimer )
end

return cancelGenerateMoleTimer