local Weapon = {}
Weapon.__index = Weapon

Weapon.new = function(self,Stat)
	local self = {}
	self.name = Stat.name
	self.x = Stat.x

	self.y = Stat.y 

	self.width = Stat.width

	self.height = Stat.height

	self.LastWidth = self.width
	self.LastHeight = self.height


	
	--Off set weapon hitbox also offset weapon image
	self.offsetX = Stat.offsetX
	self.offsetY = Stat.offsetY
	--Stats
	--Var to extend weapon hitbox // all width and height of an weapon should be 1,1 and use this vars to extend it
	self.ExtendHitboxWidth = Stat.ExtendHitboxWidth
	self.ExtendHitboxHeight = Stat.ExtendHitboxHeight

	self.beingHeld = false
	self.damage = Stat.damage
	self.Speed = Stat.Speed
	self.knockBack = Stat.knockBack 

	self.Cooldown = Stat.Cooldown
	self.Haste = Stat.Haste
	self.Timer = Stat.Timer
	--
	self.Chosen = false
	self.CanUse = true
	--Weapon Sprite
	self.DrawRotation = Stat.DrawRotation
	self.DrawIdle = nil

	self.DrawLeft = love.graphics.newImage(Stat.DrawLeft)

	self.DrawRight = love.graphics.newImage(Stat.DrawRight)

	self.DrawUp = love.graphics.newImage(Stat.DrawUp)

	self.DrawDown = love.graphics.newImage(Stat.DrawDown)
	
	self.DrawState = self.DrawLeft

	--Scale weapon Image
	self.scaleX = Stat.scaleX
	self.scaleY = Stat.scaleY
	return setmetatable(self,Weapon)
end

Weapon.Target = function(self, Target)
	if self.Timer <= 0 then
		self.Timer = self.Timer + self.Cooldown
	end

	if Target and Target.health then
			if love.keyboard.isDown('d') then
				Target.x = Target.x + self.knockBack * dt
				elseif love.keyboard.isDown('a') then 
					Target.x = Target.x - self.knockBack * dt
				elseif love.keyboard.isDown('w')  then
					Target.y = Target.y - self.knockBack * dt
				elseif love.keyboard.isDown('s')  then
					Target.y = Target.y + self.knockBack * dt
			
		end
		Target.health = Target.health - self.damage * dt
	end
end

Weapon.use = function(self,User,dt)
	self.width = self.LastWidth
	self.height = self.LastHeight

	self.x = User.x
	self.y = User.y

	if self.Timer < 1 then
		self.CanUse = true
	end

	if self.Timer > 0 then
		self.CanUse = false
		self.Timer = self.Timer - self.Haste * dt 
	end

	if User and User.CanAttack and self.CanUse then
		if love.mouse.isDown('1')  then
			if love.keyboard.isDown('d') then
					self.width = self.width + self.ExtendHitboxWidth - self.width
					self.DrawState = self.DrawRight
				elseif love.keyboard.isDown('a') then 
					--The reason I added the -1 is beause im subtracting weapon width by  ExtendhitboxWidth and weaponWidth width and value is 1,1  so i have to subtract the 1 first
					self.width = self.width - self.ExtendHitboxWidth - self.width
					self.DrawState = self.DrawLeft
				elseif love.keyboard.isDown('w')  then
					self.height = self.height - self.ExtendHitboxHeight  - self.height
					self.DrawState = self.DrawUp
				elseif love.keyboard.isDown('s')  then
					self.height = self.height + self.ExtendHitboxHeight - self.height
					self.DrawState = self.DrawDown
			end
		end
	end

end



Weapon.draw = function(self)
	love.graphics.rectangle('line',self.x + self.offsetX,self.y + self.offsetY, self.width,self.height)
	love.graphics.draw(self.DrawState ,self.x + self.offsetX,self.y + self.offsetY,self.DrawRotation,self.scaleX,self.scaleY)
end

return Weapon