generateMolePosition = generateMolePosition or require("generateMolePosition")
switchToSpawningMole = switchToSpawningMole or require("switchToSpawningMole")

createSpawningMole = {}

createSpawningMole.create = function ( ... )
	local molePosition = generateMolePosition.generate()
	local moleSprite = display.newSprite( moleSpriteMetaData.imageSheet, 
		moleSpriteMetaData.sequenceData )
	moleSprite.x = molePosition.x
	moleSprite.y = molePosition.y
	moleSprite.xScale = 1.5
	moleSprite.yScale = 1.5

	switchToSpawningMole.evaluate(moleSprite)

	return {
		sprite=moleSprite
	}
end

return createSpawningMole