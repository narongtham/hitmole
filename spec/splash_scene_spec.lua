describe("Splash scene", function ( ... )
	it("Construct a new scene", function ( ... )
		--[[given
		storyboard = {
			newScene = function ( ... )
				return {}
			end
		}

		spy.on(storyboard, "newScene")
		-- when
		splashScene = require('splashScene')
		--then
		assert.stub(storyboard.newScene).was_called()
		]]
	end)

	it("Draw background", function ( ... )
		-- body
	end)

	it("Draw logo", function ( ... )
		-- body
	end)

	it("Fade in the logo", function ( ... )
		-- body
	end)

	it("Fade out the logo", function ( ... )
		-- body
	end)

	it("Go to menu scene", function ( ... )
		-- body
	end)

	it("Purge splash scene", function ( ... )
		-- body
	end)
end)