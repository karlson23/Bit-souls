local PlayerTable = require 'playerFunctions'
local playerTable = PlayerTable.PlayerTable

local ItemTable = require 'itemTable'

local CollisionObjects = require 'MapList'
local WallTable = CollisionObjects.wallsTable

function CheckCollision(x1,y1,w1,h1,x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and 
         y2 < y1+h1

end




PlayerCollision = function(dt)
  for player_index, player in ipairs(playerTable) do

    for wall_index,wall in ipairs(WallTable) do -- WallCollision
        if CheckCollision(player.x,player.y,player.width,player.height,wallValue.x,wallValue.y,wallValue.width,wallValue.height) then
            player.x = player.lastX
            player.y = player.lastY
            player.TouchingWall = true
        end          
    end
        

    for item_index,item in ipairs(ItemTable) do
        if CheckCollision(item.x,item.y,item.width,item.height, player.x, player.y, player.width, player.height) then
          if player.InventoryObject.Inventory and #player.InventoryObject.Inventory < player.InventoryObject.InventoryLimit  then
              table.insert(player.InventoryObject.Inventory,item)
              table.remove(ItemTable,item_index)
              player.InventoryObject:PositionAdd(item)
          end
        end
    end
  end
end