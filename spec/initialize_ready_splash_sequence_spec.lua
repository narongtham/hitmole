describe("initializeReadySplashSequence", function ( ... )
	local initializeReadySplashSequence

	local readySequenceImage = {}

	local group = {}

	setup(function ( ... )

		createReadySequenceImagesLinkedList = {
			evaluate = function ( ... )
				return readySequenceImage
			end
		}
		spy.on(createReadySequenceImagesLinkedList, "evaluate")

		showReadySplash = {}
		stub(showReadySplash, "evaluate")

		initializeReadySplashSequence = require("initializeReadySplashSequence")
	end)

	it("Evaluate createReadySequenceImagesLinkedList", function ( ... )
		-- when
		initializeReadySplashSequence.evaluate(group)
		-- then
		assert.stub(createReadySequenceImagesLinkedList.evaluate).was_called()
	end)

	it("Evalaute showReadySplash", function ( ... )
		-- when
		initializeReadySplashSequence.evaluate(group)
		-- then
		assert.stub(showReadySplash.evaluate).was_called_with(group, readySequenceImage)
	end)
end)