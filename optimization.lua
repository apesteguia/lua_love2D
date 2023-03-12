function deleteEnemies()
	for i, v in ipairs(enemies) do
		if v.y == 200 then
			table.remove(enemies, i)
		end
	end
end