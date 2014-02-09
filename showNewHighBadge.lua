showNewHighBadge = {}

function showNewHighBadge.evaluate(group, target)
	local newHighBadge = display.newImage("img/sprite/new.png")

	newHighBadge.x = target.x - (target.contentWidth/2)
	newHighBadge.y = target.y - (target.contentHeight/2)

	newHighBadge.rotation = -20

	group:insert(newHighBadge)
end
return showNewHighBadge 