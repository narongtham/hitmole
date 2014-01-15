local CreateMoleSprite = {}

CreateMoleSprite.create = function ( ... )
	local moleSprite = {}
	moleSprite.options = {width = 200, height = 170, numFrames = 67}
	moleSprite.imageSheet = graphics.newImageSheet("img/sprite/mole1.png", options)
	moleSprite.sequenceData = {
		{name="spawn", start=1, count=55, time=2000 , loopCount=1},
		{name="idle", start=55, count=2, loopCount=0},
		{name="leave", frames={55,54,53,52,51,50,49,48,47,46}, time=300, loopCount=1},
		{name="dead", start=56, count=12, time=300 , loopCount=1}
	}
	return moleSprite
end

return CreateMoleSprite