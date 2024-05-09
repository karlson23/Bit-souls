local Enemy = {}
Enemy.__index = Enemy

Enemy.new = function(self,x,y,rotation,width,height,damage,health,speed,LineOfSightW,LineOfSightH)
	local self = {}
	self.x = x
	self.y = y 

	self.LastX = self.x 
	self.LastY = self.y
	self.rotation = rotation
	self.width = width
	self.height = height

	--Collision rectangle line
	--Stats
	self.damage = damage
	self.health = health
	self.speed = speed


	self.detectsPlayer = false

	self.LineOfSightW = LineOfSightW
	self.LineOfSightH = LineOfSightH
	--Can Do stuff
	self.canMove = true

	--Is happening
	self.InAir = true
	self.IsMoving = false
	--Math // Self.angle is the thing thats gets the player position


	return setmetatable(self,Enemy)
end

Enemy.Attack = function(self,target, amount, dt)
	target.health = target.health - amount * dt 
end

Enemy.draw = function(self)
	love.graphics.rectangle('line',self.x,self.y,self.LineOfSightW,self.LineOfSightH)
	love.graphics.rectangle('line',self.x,self.y,self.width,self.height)
end

return Enemy