saveTable = {}

json = json or require( "json" )

function saveTable.evaluate(table, filename)
	local pathToFile = system.pathForFile( filename , system.DocumentsDirectory )

	local file = io.open( pathToFile, "w" )

	if file then
		local contents = json.encode( table )
		file:write( contents )
		io.close( file )
	else
		error("Cannot save to file")
	end
end

return saveTable