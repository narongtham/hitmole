moleContainer = moleContainer or require("moleContainer")

countMoles = {}

function countMoles.evaluate()
	local moleCount = 0
	for key, value in pairs( moleContainer ) do
		moleCount = moleCount+1
	end
	return moleCount
end

return countMoles