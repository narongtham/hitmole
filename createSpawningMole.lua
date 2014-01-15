local createSpawningMole = {}

createSpawningMole.create = function ( ... )
	local molePosition = generateMolePosition.generate()
	local moleSprite = display.newSprite( moleSpriteMetaData.imageSheet, 
		moleSpriteMetaData.sequenceData )
	moleSprite.x = molePosition.x
	moleSprite.y = molePosition.y
	moleSprite.xScale = 1.5
	moleSprite.yScale = 1.5
	
	local spawningMole = SpawningMole.new()
	spawningMole.sprite = moleSprite

	return spawningMole
end

return createSpawningMole