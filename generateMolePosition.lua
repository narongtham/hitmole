local generateMolePosition = {}

generateMolePosition.generate = function ( ... )
	math.randomseed( os.time(  ) )

	local randomed_x = math.random(110, CONTENT_WIDTH - 100)
	local randomed_y = math.random(350, CONTENT_HEIGHT - 120)

	return {
		x = randomed_x,
		y = randomed_y
	}
end

return generateMolePosition