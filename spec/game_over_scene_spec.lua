describe("gameOverScene", function ( ... )

	local scene = {
		addEventListener = function ( ... )
			-- body
		end,
		view = {}
	}

	

	widget = {}

	showAds = {}

	local gameOverScene
	local showGameOverBackgroundImage = require "showGameOverBackgroundImage"
	local showEndingImage = require "showEndingImage"
	local showPlayAgainButton = require "showPlayAgainButton"
	local showMainMenuButton = require "showMainMenuButton"

	event = {}

	setup(function ( ... )
		stub(showGameOverBackgroundImage, "show")
		stub(showEndingImage, "show")
		stub(showPlayAgainButton, "show")
		stub(showMainMenuButton, "show")
		checkHighScore = {}
		stub(checkHighScore, "evaluate")
		stub(showAds, "evaluate")

		display.viewableContentHeight = 720

		storyboard = {
			newScene = function ( ... )
				return scene
			end
		}

		gameOverScene = require "gameOverScene"
	end)

	teardown(function ( ... )
		showGameOverBackgroundImage.show:revert()
		showEndingImage.show:revert()
		showPlayAgainButton.show:revert()
		showMainMenuButton.show:revert()
	end)


	it("Call showGameOverImage.show()", function ( ... )
		--when
		gameOverScene:createScene(event)
		--then
		assert.stub(showGameOverBackgroundImage.show).was_called_with(scene.view)
	end)

	it("Show ending image", function ( ... )
		--when
		gameOverScene:createScene(event)
		--then
		assert.stub(showEndingImage.show).was_called_with(scene.view)
	end)

	it("Show play again button", function ( ... )
		-- when
		gameOverScene:createScene(event)
		-- then
		assert.stub(showPlayAgainButton.show).was_called_with(scene.view)
	end)
	
	it("Show main menu button", function ( ... )
		-- when
		gameOverScene:createScene(event)
		-- then
		assert.stub(showMainMenuButton.show).was_called_with(scene.view, 940)
	end)

	it("Evaluate checkHighScore", function ( ... )
		-- when
		gameOverScene:enterScene(event)
		-- then
		assert.stub(checkHighScore.evaluate).was_called_with(scene.view)
	end)

	it("Evalaute showAds", function ( ... )
		-- when
		gameOverScene:enterScene(event)
		-- then
		assert.stub(showAds.evaluate).was_called()
	end)
end)