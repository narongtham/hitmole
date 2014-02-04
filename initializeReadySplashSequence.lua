initializeReadySplashSequence = {}

createReadySequenceImagesLinkedList = createReadySequenceImagesLinkedList or require("createReadySequenceImagesLinkedList")
showReadySplash = showReadySplash or require("showReadySplash")

function initializeReadySplashSequence.evaluate(group)
	local readyImageSequence = createReadySequenceImagesLinkedList.evaluate()
	showReadySplash.evaluate(group, readyImageSequence)
end

return initializeReadySplashSequence