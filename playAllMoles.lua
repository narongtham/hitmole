moleContainer = moleContainer or require "moleContainer"

playAllMoles = {}

function playAllMoles.evaluate()
	for iterateMole in pairs(moleContainer) do
		iterateMole:play( )
	end
end

return playAllMoles