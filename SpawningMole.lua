local spawningMole = {}
local spawningMole_mt = { __index = SpawningMole }

function spawningMole.new( ... )
	local newSpawningMole = {}
	local instance = setmetatable( newSpawningMole, SpawningMole_mt )

	return instance
end

return spawningMole
