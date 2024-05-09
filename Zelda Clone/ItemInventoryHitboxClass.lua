local ItemInventoryHitboxClass = {}
ItemInventoryHitboxClass.__index = ItemInventoryHitboxClass

ItemInventoryHitboxClass.new = function(self,stat)
	local self = {}
	self.mode = stat.mode
	self.x = stat.x
	self.y = stat.y 

	self.width = stat.width
	self.height = stat.height

	--Hold Item
	self.Item = stat.Item
	
	return setmetatable(self,ItemInventoryHitboxClass)
end

ItemInventoryHitboxClass.draw = function(self)
	love.graphics.rectangle(self.mode, self.x, self.y ,self.width, self.height)
	love.graphics.print(self.Item, self.x , self.y)
end

return ItemInventoryHitboxClass