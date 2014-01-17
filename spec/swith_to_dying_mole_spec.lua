describe("switchToDyingMole spec", function ( ... )

	local switchToDyingMole = require("switchToDyingMole")
	local sprite

	timer = {}
	display = require("spec.corona-busted.mocks.mockDisplay")

	setup(function ( ... )
		sprite = {}
		stub(sprite, "setSequence")
		stub(sprite, "play")
		stub(sprite, "addEventListener")
		stub(sprite, "removeEventListener")
	end)

	it("Set mole sprite sequence to 'dead'.", function ( ... )
		--when
		switchToDyingMole.evaluate(sprite)  
		--then
		assert.stub(sprite.setSequence).was_called_with(sprite, "dead")
	end)

	it("play sprite after set sequence", function ( ... )
		--when
		switchToDyingMole.evaluate(sprite)  
		--then
		assert.stub(sprite.play).was_called_with(sprite)
	end)

	it("Bind sprite event listener to sprite", function ( ... )
		--when
		switchToDyingMole.evaluate(sprite)  
		--then
		assert.stub(sprite.addEventListener).was_called_with(sprite, "sprite", switchToDyingMole.spriteEventHandler)
	end)

	it("When sprite animate ended it should set timer to delay removing mole", function ( ... )
		--given
		local sprite = {}
		local event = {
			phase="ended",
			target = sprite
		}
		stub(timer, "performWithDelay")
		--when
		switchToDyingMole.spriteEventHandler(event)
		--then
		assert.stub(timer.performWithDelay).was_called_with(300, switchToDyingMole.removeMoleSprite)
	end)

	it("When sprite animate ended it should set sprite to waitForRemoveSprite", function ( ... )
		--given
		local sprite = {}
		local event = {
			phase="ended",
			target = sprite
		}
		stub(timer, "performWithDelay")
		--when
		switchToDyingMole.spriteEventHandler(event)
		--then
		assert.are.same(switchToDyingMole.waitForRemoveSprite, sprite)
	end)

	it("When call removeMoleSprite() it should remove sprite from display", function ( ... )
		--given
		local sprite = {}
		switchToDyingMole.waitForRemoveSprite = sprite
		stub(display, "remove")
		--when
		switchToDyingMole.removeMoleSprite(event)
		--then
		assert.stub(display.remove).was_called_with(sprite)
	end)

	it("When sprite animate ended it should remove sprite event listener", function ( ... )
		error("Not yet implemented")
	end)

	it("When sprite animate ended it should create spawning mole", function ( ... )
		error("Not yet implemented")
	end)
end)