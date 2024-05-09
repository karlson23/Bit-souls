local GameState = {}
GameState.__index = GameState

GameState.new = function(self,mode)
	local self = {}
	self.mode = mode
	self.Run = false
	return setmetatable(self,GameState)
end

GameState.update = function(self)
end

return GameState