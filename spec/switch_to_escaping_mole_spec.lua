describe("switchToEscapingMole spec", function ( ... )

	local switchToEscapingMole = require("switchToEscapingMole")
	local sprite

	timer = {}
	display = require("spec.corona-busted.mocks.mockDisplay")
	createSpawningMole = require("createSpawningMole")
	escapeCount = 3

	setup(function ( ... )
		sprite = {}
		stub(sprite, "setSequence")
		stub(sprite, "play")
		stub(sprite, "addEventListener")
		stub(sprite, "removeEventListener")
	end)

	it("Set mole sprite sequence to 'leave'.", function ( ... )
		--when
		switchToEscapingMole.evaluate(sprite)  
		--then
		assert.stub(sprite.setSequence).was_called_with(sprite, "escape")
	end)

	it("play sprite after set sequence", function ( ... )
		--when
		switchToEscapingMole.evaluate(sprite)  
		--then
		assert.stub(sprite.play).was_called_with(sprite)
	end)

	it("Bind sprite event listener to sprite", function ( ... )
		--when
		switchToEscapingMole.evaluate(sprite)  
		--then
		assert.stub(sprite.addEventListener).was_called_with(sprite, "sprite", switchToEscapingMole.spriteEventHandler)
	end)

	it("When sprite animate ended it should set timer to delay removing mole", function ( ... )
		--given
		local sprite = {}
		local event = {
			phase="ended",
			target = sprite
		}
		stub(timer, "performWithDelay")
		stub(sprite, "removeEventListener")
		--when
		switchToEscapingMole.spriteEventHandler(event)
		--then
		assert.stub(timer.performWithDelay).was_called_with(300, switchToEscapingMole.removeMoleSprite)
	end)

	it("When sprite animate ended it should set sprite to waitForRemoveSprite", function ( ... )
		--given
		local sprite = {}
		local event = {
			phase="ended",
			target = sprite
		}
		stub(timer, "performWithDelay")
		stub(sprite, "removeEventListener")
		--when
		switchToEscapingMole.spriteEventHandler(event)
		--then
		assert.are.same(switchToEscapingMole.waitForRemoveSprite, sprite)
	end)

	it("When call removeMoleSprite() it should remove sprite from display", function ( ... )
		--given
		local sprite = {}
		switchToEscapingMole.waitForRemoveSprite = sprite
		stub(display, "remove")
		--when
		switchToEscapingMole.removeMoleSprite(event)
		--then
		assert.stub(display.remove).was_called_with(sprite)
	end)

	it("When sprite animate ended it should remove sprite event listener", function ( ... )
		--given
		local sprite = {}
		local event = {
			phase="ended",
			target = sprite
		}
		stub(timer, "performWithDelay")
		stub(sprite, "removeEventListener")
		--when
		switchToEscapingMole.spriteEventHandler(event)
		--then
		assert.stub(sprite.removeEventListener)
			.was_called_with(sprite, "sprite", switchToEscapingMole.spriteEventHandler)
	end)

	it("When call removeMoleSprite() it should create spawning mole", function ( ... )
		--given
		local sprite = {}
		switchToEscapingMole.waitForRemoveSprite = sprite
		stub(display, "remove")
		stub(createSpawningMole, "create")
		--when
		switchToEscapingMole.removeMoleSprite(event)
		--then
		assert.stub(createSpawningMole.create)
			.was_called()
		createSpawningMole.create:revert()
	end)
end)