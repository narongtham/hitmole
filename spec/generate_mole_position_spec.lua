describe("Generate mole position spec", function ( ... )
	CONTENT_WIDTH = 720
	CONTENT_HEIGHT = 1024

	local generateMolePosition = require('generateMolePosition')

	it("Should call generate randomed seed", function ( ... )
		--given
		spy.on(math, "randomseed")
		--when
		generateMolePosition.generate()
		--then
		assert.spy(math.randomseed).was_called_with(os.time())
	end)

	it("Should generate randomed x position for spawning mole", function ( ... )
		--given
		spy.on(math, "random")
		--when
		generateMolePosition.generate()
		--then
		assert.spy(math.random).was_called_with(110, CONTENT_WIDTH - 100)
	end)

	it("Should generate randomed y position for spawning mole", function ( ... )
		--given
		spy.on(math, "random")
		--when
		generateMolePosition.generate()
		--then
		assert.spy(math.random).was_called_with(350, CONTENT_HEIGHT - 120)
	end)

	it("Return x position should be in range", function ( ... )
		--when
		local result = generateMolePosition.generate()
		--then
		assert.are.True(result.x >= 110 and result.x <= CONTENT_WIDTH - 100)
	end)

	it("Return y  position should be in range", function ( ... )
		--when
		local result = generateMolePosition.generate()
		--then
		assert.are.True(result.y >= 350 and result.y <= CONTENT_HEIGHT - 120)
	end)
end)