local Hud = {}
Hud.__index = Hud

Hud.new = function(self,User,OneX,OneY, TwoX,TwoY, ThirdX,ThirdY)

	local self = {}

	self.User = User
	self.OneX = OneX
	self.OneY = OneY

	self.TwoX = TwoX
	self.TwoY = TwoY

	self.ThirdX = ThirdX
	self.ThirdY = ThirdY

	self.inventoryName = 0

	return setmetatable(self,Hud)
end


Hud.update = function(self,dt)
	for inventory_index,inventory in ipairs(self.User.InventoryObject.Inventory) do
		if inventory.Chosen then
			self.inventoryName = inventory.name
		end
   	end
end

Hud.draw = function(self)
	love.graphics.print(math.floor(self.User.health),self.OneX,self.OneY)
	
	love.graphics.print(self.inventoryName,self.TwoX,self.TwoY)
end

return Hud