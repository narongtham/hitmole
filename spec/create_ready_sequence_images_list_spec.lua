describe("createReadySequenceImagesLinkedList", function ( ... )
	local createReadySequenceImagesLinkedList

	local expectedResult = nil

	expectedResult = { next = expectedResult, value = "seq#1"}
	expectedResult = { next = expectedResult, value = "seq#2"}
	expectedResult = { next = expectedResult, value = "seq#3"}

	setup(function ( ... )

		readySplashConfigurations = {
			sequence = {
				"seq#1",
				"seq#2",
				"seq#3"
			}
		}

		createReadySequenceImagesLinkedList = require("createReadySequenceImagesLinkedList")
	end)

	it("Create linkedlist from sequence configuration", function ( ... )
		-- when
		local result = createReadySequenceImagesLinkedList.evaluate()
		-- then
		assert.are.same(result, expectedResult)
	end)
end)