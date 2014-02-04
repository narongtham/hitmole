initializeReadySplashSequence = {}

createReadySequenceImagesLinkedList = createReadySequenceImagesLinkedList or require("createReadySequenceImagesLinkedList")
showReadySplashImage = showReadySplashImage or require("showReadySplashImage")

function initializeReadySplashSequence.evaluate()
	local readyImageSequence = createReadySequenceImagesLinkedList.evaluate()
	showReadySplashImage.evaluate(readyImageSequence)
end

return initializeReadySplashSequence