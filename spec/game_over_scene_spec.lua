describe("gameOverScene", function ( ... )

	local scene = {
		addEventListener = function ( ... )
			-- body
		end,
		view = {}
	}

	storyboard = {
		newScene = function ( ... )
			return scene
		end
	}

	widget = {}

	local gameOverScene = require "gameOverScene"
	local showGameOverBackgroundImage = require "showGameOverBackgroundImage"
	local showEndingImage = require "showEndingImage"
	local showPlayAgainButton = require "showPlayAgainButton"

	event = {}

	setup(function ( ... )
		stub(showGameOverBackgroundImage, "show")
		stub(showEndingImage, "show")
		stub(showPlayAgainButton, "show")
	end)

	teardown(function ( ... )
		showGameOverBackgroundImage.show:revert()
		showEndingImage.show:revert()
		showPlayAgainButton.show:revert()
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

	it("Show share button")
	
	it("Show main menu button")
end)