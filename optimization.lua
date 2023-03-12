function deleteEnemies()
	for i, v in ipairs(enemies) do
		if v.y > 600 then
			table.remove(enemies, i)
		end
	end
end

function deleteStars()
    for i, v in ipairs(stars) do
        if stars[i][2] > 600 then
            table.remove(stars, i)
        end
    end
end
