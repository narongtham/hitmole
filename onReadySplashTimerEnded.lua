onReadySplashtimerEnded = {}

function onReadySplashtimerEnded.evaluate(event)
	display.remove(event.source.params.target)
end

return onReadySplashtimerEnded