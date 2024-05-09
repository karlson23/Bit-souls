local Mouse = {}
Mouse.__index = Mouse

Mouse.new = function(self,x,y,width,height)
	local self = {}
	self.x = x
	self.y = y 
	self.width = width
	self.height = height

	return setmetatable(self,Mouse)
end

Mouse.update = function(self)
	self.x,self.y = cam:mousePosition()
	
end

Mouse.draw = function(self)
	love.graphics.rectangle('line',self.x,self.y,self.width,self.height)
end

return Mouse