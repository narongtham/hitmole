switchToSpawningMole = switchToSpawningMole or require("switchToSpawningMole")
addMoleToContainer = addMoleToContainer or require("addMoleToContainer")

createSpawningMole = {}

createSpawningMole.create = function (molePosition)
	local moleSprite = display.newSprite( moleSpriteMetaData.imageSheet, 
		moleSpriteMetaData.sequenceData )
	moleSprite.x = molePosition.x
	moleSprite.y = molePosition.y
	moleSprite.xScale = 1.5
	moleSprite.yScale = 1.5

	currentViewGroup:insert(moleSprite)
	addMoleToContainer.add(moleSprite)
	switchToSpawningMole.evaluate(moleSprite)
	
	return {
		sprite=moleSprite
	}
end

return createSpawningMole