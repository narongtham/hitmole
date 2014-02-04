describe("initializeReadySplashSequence", function ( ... )
	local initializeReadySplashSequence

	local readySequenceImage = {}

	setup(function ( ... )

		createReadySequenceImagesLinkedList = {
			evaluate = function ( ... )
				return readySequenceImage
			end
		}
		spy.on(createReadySequenceImagesLinkedList, "evaluate")

		showReadySplashImage = {}
		stub(showReadySplashImage, "evaluate")

		initializeReadySplashSequence = require("initializeReadySplashSequence")
	end)

	it("Evaluate createReadySequenceImagesLinkedList", function ( ... )
		-- when
		initializeReadySplashSequence.evaluate()
		-- then
		assert.stub(createReadySequenceImagesLinkedList.evaluate).was_called()
	end)

	it("Evalaute showReadySplash", function ( ... )
		-- when
		initializeReadySplashSequence.evaluate()
		-- then
		assert.stub(showReadySplashImage.evaluate).was_called_with(readySequenceImage)
	end)
end)