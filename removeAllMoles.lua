moleContainer = moleContainer or require("moleContainer")

removeAllMoles = {}

function removeAllMoles.evaluate()
	for iterateMole in pairs(moleContainer) do
		if iterateMole.removeAllEventListeners then
			iterateMole:removeAllEventListeners()
		end
		display.remove( iterateMole )
	end
end

return removeAllMoles