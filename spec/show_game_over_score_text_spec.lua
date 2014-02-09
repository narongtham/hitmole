describe("showGameOverScoreText", function ( ... )
	local showGameOverScoreText 

	local textObject = {}

	local fontNameByPlatForm = "..."

	local group = {}

	local targetObject = {
		x = 365,
		y = 720,
		contentWidth = 250,
		contentHeight = 50
	}

	setup(function ( ... )

		display = {
			newText = function ( ... )
				return textObject
			end
		}
		spy.on(display, "newText")

		getFontNameByPlatform = {
			evaluate = function ( ... )
				return fontNameByPlatForm
			end
		}
		spy.on(getFontNameByPlatform, "evaluate")

		stub(textObject, "setFillColor")

		stub(group, "insert")

		showGameOverScoreText = require("showGameOverScoreText")
	end)

	it("Evalaute getFontNameByPlatform", function ( ... )
		-- when
		showGameOverScoreText.evaluate(group, targetObject)
		-- then
		assert.stub(getFontNameByPlatform.evaluate).was_called()
	end)

	it("Create text with proper value", function ( ... )
		-- given
		score = 0
		-- when
		showGameOverScoreText.evaluate(group, targetObject)
		-- then
		assert.spy(display.newText).was_called_with("High score: 0", 0, 0, fontNameByPlatForm, 40)
	end)

	it("Set x to center", function ( ... )
		-- given
		DISPLAY_CENTER_X = 365
		-- when
		showGameOverScoreText.evaluate(group, targetObject)
		-- then
		assert.are.equal(textObject.x, DISPLAY_CENTER_X)
	end)

	it("Set y to under target object with offset", function ( ... )
		-- given
		expectedY=753
		-- when
		showGameOverScoreText.evaluate(group, targetObject)
		-- then
		assert.are.equal(textObject.y, expectedY)
	end)

	it("insert to group", function ( ... )
		-- when
		showGameOverScoreText.evaluate(group, targetObject)
		-- then
		assert.stub(group.insert).was_called_with(group, textObject)
	end)

end)