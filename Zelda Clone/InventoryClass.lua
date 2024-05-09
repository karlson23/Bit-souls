local Inventory = {}
Inventory.__index = Inventory

local ItemInventoryHitboxClass = require 'ItemInventoryHitboxClass'

Inventory.new = function(self, stat)
	local self = {}

	self.User = stat.User
	self.x = stat.x 
	self.y = stat.y

	self.width = stat.width
	self.height = stat.height

	self.Inventory = {}
	self.ItemRelated = {} --List of rectangles with the items info used for collision of listed items (not their actual hitboxes used for weapon to object, this is just for inventory item gets picked system.)
	self.InventoryLimit = 4 --amount of stuff User inventory can have

	self.mouseX, self.mouseY = love.mouse.getPosition()
	self.mouseWidth = 15
	self.mouseHeight = 15

	self.InventoryX = stat.InventoryX
	self.InventoryY = stat.InventoryY
	self.InventoryWidth = stat.InventoryWidth
	self.InventoryHeight = stat.InventoryHeight

	self.Spacing = stat.Spacing

	self.Index = 0
	return setmetatable(self, Inventory)
end

Inventory.PositionAdd = function(self, Target)
	for item_index, item in ipairs(self.Inventory) do

		self.Spacing = self.Spacing + self.Spacing

		local Hitbox = ItemInventoryHitboxClass:new({
			mode = 'line', 
			x = self.InventoryX + self.Spacing, 
			y = self.InventoryY, 
			width = self.InventoryWidth,
			height = self.InventoryHeight,
			
			Item = item})

		table.insert(self.ItemRelated, Hitbox)
	end


end

Inventory.update = function(self)
	self.mouseX, self.mouseY = love.mouse.getPosition()




	for item_index, item in ipairs(self.ItemRelated) do
		if CheckCollision(self.mouseX,self.mouseY, self.mouseWidth, self.mouseHeight, item.x, item.y , item.width, item.height) then
			item.Item.Chosen = true
		end
	end

	print(self.InventoryX)
end

Inventory.draw = function(self)
	love.graphics.push()

	for hitbox_index, hitbox in ipairs(self.ItemRelated) do
		hitbox:draw()
	end

	love.graphics.pop()
end

return Inventory