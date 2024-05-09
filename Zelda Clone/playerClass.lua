local Player = {}
Player.__index = Player



Player.new = function(self,stat)
	local self = {}
	self.x = stat.x 
	self.y = stat.y 

	self.lastX = self.x
	self.lastY = self.y
	
	self.width = stat.width
	self.height = stat.height

	--Hud stat
	self.ShowOneX = stat.ShowOneX
	self.ShowOneY = stat.ShowOneY

	self.ShowTwoX = stat.ShowTwoX
	self.ShowTwoY = stat.ShowTwoY

	--Can happen
	self.CanUseInventory = true
	self.CanUse = true
	
	self.CanAttack = true
	self.CanWalk = true 

	self.BeDrawn = stat.BeDrawn

	self.CanHoldWeapon = true
	--Is happening

	self.IsWalking = false

	self.IsFacingLeft = 'IsFacingLeft'

	self.IsFacingRight = 'IsFacingRight'

	self.IsFacingUp = 'IsFacingUp'
	
	self.IsFacingDown = 'IsFacingDown'

	self.Direction = 'standingStill'

	self.TouchingWall = false

	self.HoldingWeapon = false

	self.InventoryOpen = false
	--Stats
	

	self.ThrowSpeedX = stat.ThrowSpeedX
	self.ThrowSpeedY = stat.ThrowSpeedY
	self.health = stat.health
	self.speed = stat.speed

	--Images 
	--Inventory stats
	self.InventoryObject = stat.InventoryObject

	self.InvetoryItemHitbox = {}

	return setmetatable(self,Player)
end


Player.update = function(self,dt)
	local mouseX,mouseY = love.mouse.getPosition()
	local mouseWidth = 15
	local mouseHeight = 15
	self.TouchingWall = false

	cam:lookAt(self.x, self.y)

	self.lastX = self.x
	self.lastY = self.y

	self.IsWalking = false
	
	if love.keyboard.isDown('d') and self.CanWalk then
			self.x = self.x + self.speed * dt
			self.IsWalking = false
			self.Direction = self.IsFacingRight
		elseif love.keyboard.isDown('a') and self.CanWalk then
			self.x = self.x - self.speed * dt
			self.IsWalking = false
			self.Direction = self.IsFacingLeft
		elseif love.keyboard.isDown('w') and self.CanWalk then
			self.y = self.y - self.speed * dt
			self.IsWalking = false
			self.Direction = self.IsFacingUp
		elseif love.keyboard.isDown('s') and self.CanWalk then
			self.y = self.y + self.speed * dt
			self.IsWalking = false
			self.Direction = self.IsFacingDown 
	end

	--Update player Inventory object
	self.InventoryObject:update()
	

	
end 



Player.draw = function(self)
	if self.BeDrawn then
		love.graphics.rectangle('line',self.x ,self.y,self.width,self.height)

		if self.InventoryObject.Inventory then
			-- If item is chosen then update it
			for item_index, item in ipairs(self.InventoryObject.Inventory) do
				if item.Chosen then
					item:draw()
				end
			end
		end
	end
end

return Player