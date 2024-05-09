local PlayerTables = require 'playerFunctions'
local playerTable = PlayerTables.PlayerTable

local EnemyClass = require 'enemyClass'
local EnemySpawn = require 'MapList'
local NamelessSoldierSpawn = EnemySpawn.NamelessSoldierSpawnTable 

local EnemyTable = {
	NamelessSoldierTable = {}
}

LoadEnemy = function()
	for enemy_index, enemy in ipairs(NamelessSoldierSpawn) do
		--Make an enemy for each spawn object in the table nameless soldier spawn
		local NamelessSoldier = EnemyClass:new(enemy.x,enemy.y,0,5,50,5,10,50,25,25)
		table.insert(EnemyTable.NamelessSoldierTable,NamelessSoldier)
	end
end

UpdateEnemy = function(dt)
	for enemy_index, enemy in ipairs(EnemyTable.NamelessSoldierTable) do

		for player_index,player in ipairs(playerTable) do

			for item_index, item in ipairs(player.InventoryObject.Inventory) do
				if CheckCollision(item.x, item.y, item.width, item.height, enemy.x, enemy.y, enemy.width, enemy.height) then
					if item.Target then
						item:Target(enemy)
					end
				end
			end

			if CheckCollision(enemy.x, enemy.y, enemy.LineOfSightW,enemy.LineOfSightH, player.x, player.y , player.width, player.height) then
				enemy.detectsPlayer = true
				if enemy.detectsPlayer then
					local angle = math.atan2(player.y - enemy.y,player.x - enemy.x) 
					local sin = math.sin(angle)
					local cos = math.cos(angle)
					enemy.x = enemy.x + enemy.speed * cos * dt
					enemy.y = enemy.y + enemy.speed * sin * dt
				end
			end

			if CheckCollision(enemy.x, enemy.y, enemy.width,enemy.height, player.x, player.y , player.width, player.height) then
				enemy:Attack(player, enemy.damage, dt)
			end
	
		end
	end
end

DrawEnemy = function()
	for enemy_index,enemy in ipairs(EnemyTable.NamelessSoldierTable) do
		enemy:draw()
	end
end

return EnemyTable