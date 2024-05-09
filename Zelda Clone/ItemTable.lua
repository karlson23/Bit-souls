local ItemTable = {}

function draw_Items()
	for item_index,item in ipairs(ItemTable) do 
		item:draw()
	end
end

return ItemTable