createReadySequenceImagesLinkedList = {}

readySplashConfigurations = readySplashConfigurations or require("config.readySplashConfigurations")

function createReadySequenceImagesLinkedList.evaluate()
	local result = nil
	for key, value in pairs(readySplashConfigurations.sequence) do
		result = { next=result, value=value}
	end
	
	return result
end

return createReadySequenceImagesLinkedList