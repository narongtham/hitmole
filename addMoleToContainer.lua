moleContainer = moleContainer or require "moleContainer"

addMoleToContainer = {}

function addMoleToContainer.add(mole)
	moleContainer[mole] = true
end

return addMoleToContainer