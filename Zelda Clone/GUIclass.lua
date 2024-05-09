local GUI = {}
GUI.__index = GUI

GUI.new = function(self,stat)
	local self = {}
	self.Mode = stat.Mode -- Wether love.graphics.rectangle is 'line' or 'fill'

	self.x = stat.x
	self.y = stat.y

	self.width = stat.width
	self.height = stat.height

end

GUI.draw = function(self)
	love.graphics.rectangle(self.Mode,self.x,self.y,self.width,self.height)
end
return GUI