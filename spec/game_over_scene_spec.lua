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

	local gameOverScene = require "gameOverScene"
	local showGameOverBackgroundImage = require "showGameOverBackgroundImage"
	event = {}

	setup(function ( ... )
		stub(showGameOverBackgroundImage, "show")
	end)

	teardown(function ( ... )
		showGameOverBackgroundImage.show:revert()
	end)


	it("Call showGameOverImage.show()", function ( ... )
		--when
		gameOverScene:createScene(event)
		--then
		assert.stub(showGameOverBackgroundImage.show).was_called_with(scene.view)
	end)

	it("Show ending image", function ( ... )
		--given
		spy.on(display, "newImage")
		--when
		gameOverScene:createScene(event)
		--then
		assert.spy(display.newImage).was_called_with("img/end_image_1.png")
	end)

	it("Set ending image x to center of screen", function ( ... )
		-- body

	end)
	it("Show share button")
	it("Show restart button")
	it("Show main menu button")
end)