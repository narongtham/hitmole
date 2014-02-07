showNewHighBadge = {}

function showNewHighBadge.evaluate(group)
	local newHighBadge = display.newImage("img/sprite/new.png")

	newHighBadge.x = 164
	newHighBadge.y = 686

	newHighBadge.rotation = 45

	group:insert(newHighBadge)
end
return showNewHighBadge 