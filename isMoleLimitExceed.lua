getMoleLimit = getMoleLimit or require("getMoleLimit")
countMoles = countMoles or require("countMoles")

isMoleLimitExceed = {}

function isMoleLimitExceed.evaluate()
	local moleLimit = getMoleLimit.evaluate()
	local molesCount = countMoles.evaluate()

	if moleLimit == molesCount then
		print("Mole limit exceeded")
		error("Mole limit exceeded")
	end
end

return isMoleLimitExceed