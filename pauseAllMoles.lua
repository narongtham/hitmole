local moleContainer = moleContainer or require "moleContainer"

pauseAllMole = {}

function pauseAllMole.evaluate()
	for iterateMole in  pairs(moleContainer) do
		iterateMole:pause()
	end
end

return pauseAllMole