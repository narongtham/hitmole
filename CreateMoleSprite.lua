local createMoleSprite = {}

createMoleSprite.create = function ( ... )
	local moleSprite = {}
	moleSprite.options = {width = 200, height = 170, numFrames = 122}
	moleSprite.imageSheet = graphics.newImageSheet("img/sprite/moleSprite.png", moleSprite.options)
	moleSprite.sequenceData = {
		{name="spawn", start=1, count=56, time=2000 , loopCount=1},
		{name="idle", start=83, count=40, time=1000, loopCount=0},
		{name="escape", start=57, count=14, time=300, loopCount=1},
		{name="dead", start=70, count=12, time=300 , loopCount=1}
	}
	return moleSprite
end

return createMoleSprite