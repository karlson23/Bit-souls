local ObjectTable = {
	PlayerTable = {}
}

local HudTable = {}
local InventoryTable = {}
local InventoryClass = require 'InventoryClass'
local HudClass = require 'HudClass'
local PlayerClass = require 'playerClass'

local WeaponClass = require 'WeaponClass'

local PlayerMain = PlayerClass:new({
	x = 50,
	y = 50,
	width = 50,
	height = 50,
	speed = 200,
	health = 3,
	ThrowSpeedX = 70,
	ThrowSpeedY = 70,
	BeDrawn = true,
	name = 'Lua'}) -- main Character

table.insert(ObjectTable.PlayerTable,PlayerMain)


LoadPlayerRelated = function()
	for player_index, player in ipairs(ObjectTable.PlayerTable) do
		local PlayerHud = HudClass:new(player,20,10,20,25)
		table.insert(HudTable, PlayerHud)
	end

	for player_index, player in ipairs(ObjectTable.PlayerTable) do
		local Inventory = InventoryClass:new({
				User = player,
				InventoryWidth = 25,
				InventoryHeight = 25,
				InventoryX = 30,
				InventoryY = 10,

				InventorySpace = 10,
				Spacing = 30})
		player.InventoryObject = Inventory
		table.insert(InventoryTable,Inventory)
	end
end

updatePlayer = function(dt)
	for player_index, player in ipairs(ObjectTable.PlayerTable) do
		player:update(dt)

		for item_index, item in ipairs(player.InventoryObject.Inventory) do
		-- If item is chosen then update it
			if item.Chosen then
				item:use(player, dt)
			end
		end
	end

	

	for hud_index,hud in ipairs(HudTable) do
		hud:update(dt)
	end
end



DrawPlayer = function()
	for player_index,player in ipairs(ObjectTable.PlayerTable) do
		player:draw()
	end
end

DrawHud = function()
	for hud_index,hud in ipairs(HudTable) do
		hud:draw()
	end
end

DrawInventory = function()
	for inventory_index,inventory in ipairs(InventoryTable) do
		inventory:draw()
	end
end
return ObjectTable