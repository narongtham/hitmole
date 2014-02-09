describe("showHighScoreText", function ( ... )
	local showHighScoreText 

	local textObject = {}

	local fontNameByPlatForm = "..."

	local group = {}

	local verticalPos = 720

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

		getHighScore = { 
			evaluate=function( ... )
				return 0
			end
		}
		spy.on(getHighScore, "evaluate")

		stub(textObject, "setFillColor")

		stub(group, "insert")

		showHighScoreText = require("showHighScoreText")
	end)

	it("Evaluate getHighScore", function ( ... )
		-- when
		showHighScoreText.evaluate(group, verticalPos)
		-- then
		assert.stub(getHighScore.evaluate).was_called()
	end)

	it("Evalaute getFontNameByPlatform", function ( ... )
		-- when
		showHighScoreText.evaluate(group, verticalPos)
		-- then
		assert.stub(getFontNameByPlatform.evaluate).was_called()
	end)

	it("Create text with proper value", function ( ... )
		-- when
		showHighScoreText.evaluate(group, verticalPos)
		-- then
		assert.spy(display.newText).was_called_with("High score: 0", 0, 0, fontNameByPlatForm, 40)
	end)

	it("Set x to center", function ( ... )
		-- given
		DISPLAY_CENTER_X = 365
		-- when
		showHighScoreText.evaluate(group, verticalPos)
		-- then
		assert.are.equal(textObject.x, DISPLAY_CENTER_X)
	end)

	it("Set y to 720", function ( ... )
		-- given
		expectedY=720
		-- when
		showHighScoreText.evaluate(group, verticalPos)
		-- then
		assert.are.equal(textObject.y, expectedY)
	end)

	it("insert to group", function ( ... )
		-- when
		showHighScoreText.evaluate(group, verticalPos)
		-- then
		assert.stub(group.insert).was_called_with(group, textObject)
	end)

end)