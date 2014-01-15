local createSpawningMole = {}

createSpawningMole.create = function ( ... )
	local molePosition = generateMolePosition.generate()

	local spawningMole = SpawningMole.new()
	return spawningMole
end

return createSpawningMole