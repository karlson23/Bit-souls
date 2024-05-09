local ItemTable = require 'itemTable'
local WeaponTable = {}

local CollisionObjects = require 'MapList'
local SwordSpawnTable = CollisionObjects.SwordSpawnTable

local WeaponClass = require 'WeaponClass'



function LoadWeapons()
	for _,v in ipairs(SwordSpawnTable) do
		--LoadSword

    local Sword = WeaponClass:new({
            name = 'Sword',
            x = v.x,
            y = v.y,
            width = 5,
            height = 5,
            damage = 5,
            Speed = 5,
            ExtendHitboxWidth = 100,
            ExtendHitboxHeight = 50,
            offsetX = 25,
            offsetY = 25,
            DrawRotation = 0,
            DrawLeft = 'Assets/Weapons/SwordLeft.png', 
            DrawRight = 'Assets/Weapons/SwordRight.png',
            DrawUp = 'Assets/Weapons/SwordUp.png',
            DrawDown = 'Assets/Weapons/SwordDown.png',
            scaleX = 1,
            scaleY = 1, 
            knockBack = 15,
        	Cooldown = 10,
        	Haste = 2,
        	Timer = 0})
		table.insert(ItemTable, Sword)
	end

end


return WeaponTable	