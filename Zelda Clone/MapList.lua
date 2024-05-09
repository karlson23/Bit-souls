local MapClass = require 'MapBluePrint'

local MainWorld = MapClass:new(0,0,0,0,0,'Maps/MainWorld.lua')

local ObjectTable = {

	GameFloor = {}, --Game floor not the map floor

	wallsTable = {}, -- Table of Walls

	SwordSpawnTable = {}, --Place where the weapon Sword Spawns

	NamelessSoldierSpawnTable = {},

	HealthPotionSpawnTable = {}


}


if MainWorld.image.layers['Walls'] then -- This Access the walls from tiled and Implements them into the game
    for _,v in ipairs(MainWorld.image.layers['Walls'].objects) do --Load All the Objects from LevelOnePart1 most of our objects are in there.
	      	local wallObj = {x = v.x,y = v.y,width = v.width,height = v.height}
	      	table.insert(ObjectTable.wallsTable,wallObj)
    end
end

if MainWorld.image.layers['SwordSpawn'] then
	for _,v in ipairs(MainWorld.image.layers['SwordSpawn'].objects) do
			local SwordSpawnObj = {x = v.x,y = v.y, width = v.width,height = v.height}
			table.insert(ObjectTable.SwordSpawnTable, SwordSpawnObj)
	end
end

if MainWorld.image.layers['NamelessSoldierSpawn'] then
	for _,v in ipairs(MainWorld.image.layers['NamelessSoldierSpawn'].objects) do
			local NamelessSoldierSpawn = {x = v.x, y = v.y, width = v.width, height = v.height}
			table.insert(ObjectTable.NamelessSoldierSpawnTable, NamelessSoldierSpawn) 
	end
end

if MainWorld.image.layers['HealPotionSpawn'] then
	for _,v in ipairs(MainWorld.image.layers['HealPotionSpawn'].objects) do
			local HealthPotionSpawn = {x = v.x, y = v.y}
			table.insert(ObjectTable.HealthPotionSpawnTable, HealthPotionSpawn)
	end
end

function DrawMap()
	love.graphics.push()
	MainWorld.image:drawLayer(MainWorld.image.layers['Floor'])
	MainWorld.image:drawLayer(MainWorld.image.layers['ForeGroundFloor'])
	MainWorld.image:drawLayer(MainWorld.image.layers['BackgroundTrees'])
	MainWorld.image:drawLayer(MainWorld.image.layers['Trees'])
	love.graphics.pop()
end

return ObjectTable