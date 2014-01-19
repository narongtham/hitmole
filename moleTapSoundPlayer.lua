moleTapSoundPlayer = {}

function moleTapSoundPlayer.play()
	audio.play( tapSound, {channel=2, loops=0} )
end

return moleTapSoundPlayer