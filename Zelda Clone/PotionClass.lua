local Potion = {}
Potion.__index = Potion

Potion.new = function(self,x,y,rotation,width,height,HealthAdd,name)
	local self = {}
	self.x = x 
	self.y = y 
	self.width = width
	self.height = height

	self.HealthAdd = HealthAdd

	self.NotUsed = true

	self.name = name
	return setmetatable(self,Potion)
end	

Potion.use = function(self,target)
	--Potion Follow user
	self.x = target.x + 20
	self.y = target.y + 20
	if not self.Used then
		if love.keyboard.isDown('r') then
			target.health = target.health + self.HealthAdd
			self.Used = true
		end
	end
end

Potion.draw = function(self)
	love.graphics.rectangle('line',self.x,self.y,self.width,self.height)
end

return Potion