dt = love.timer.getDelta( )

local Camera = require 'Library/camera'

cam = Camera()

sti = require 'Library/sti'

mouseTable = {}

local MouseClass = require 'MouseClass'
local mouse = MouseClass:new(0,0,15,15) 
table.insert(mouseTable,mouse)

require 'WeaponFunctions'

require 'MapList'


require 'EnemyFunctions'
require 'StateManager'

require 'CollisionChecker'


function love.keypressed(key)
end

function love.load( ... )
	-- body
	StateManagerLoad()
end

function love.update(dt)
	StateManagerUpdate(dt)
end

function love.draw()
	--Draw mouse
	StateManagerDraw()

	
end