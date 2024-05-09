local GameStateObject = require 'GameStateClass'

local Menu = GameStateObject:new('Menu')

local CheckingMap = GameStateObject:new('CheckingMap')

local GameRunning = GameStateObject:new('GameRunning')

GameRunning.Run = true

local PlayerFunctions = require 'playerFunctions'

require 'PotionFunctions'
StateManagerLoad = function()
    if Menu.Run then
    end

    if CheckingMap.Run then
    end

  

    if GameRunning.Run then
        --update Mouse
        LoadPlayerRelated()
        LoadEnemy()
        LoadPotion()
        LoadWeapons()
    end
end

StateManagerUpdate = function(dt)
    if Menu.Run then
    end

    if CheckingMap.Run then
    end




    if GameRunning.Run then
        --update Mouse

        for _,v in ipairs(mouseTable) do
            v:update()

        end
        updatePlayer(dt)
        PlayerCollision(dt)
        UpdateEnemy(dt)

    end
end

StateManagerDraw = function()
    if Menu.Run then
    end

    if CheckingMap.Run then
    end

  


    if GameRunning.Run then
        cam:attach()
        DrawMap()
        DrawPlayer()
        for _,v in ipairs(mouseTable) do
            v:draw()
        end
        DrawEnemy()
        draw_Items()
        cam:detach()
        DrawHud()
        DrawInventory()
    end
end

