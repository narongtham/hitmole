initializeReadySplashSequence = {}

createReadySequenceImagesLinkedList = createReadySequenceImagesLinkedList or require("createReadySequenceImagesLinkedList")
showReadySplashImage = showReadySplashImage or require("showReadySplashImage")

function initializeReadySplashSequence.evaluate(group)
	local readyImageSequence = createReadySequenceImagesLinkedList.evaluate()
	showReadySplashImage.evaluate(group, readyImageSequence)
end

return initializeReadySplashSequence