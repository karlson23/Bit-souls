local ItemTable = require 'itemTable'
local ObjectTable = require 'MapList'
local HealthPotionSpawnTable = ObjectTable.HealthPotionSpawnTable
local PotionClass = require 'PotionClass'

LoadPotion = function()
	for spawn_index,spawn in ipairs(HealthPotionSpawnTable) do
		local HealthPotion = PotionClass:new(spawn.x,spawn.y,0,15,15,2,'HealthPotion')
		table.insert(ItemTable, HealthPotion)
	end
end

