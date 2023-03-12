function checkCollision(dt)
	for i, v in ipairs(enemies) do
		if v.x == player.x or v.y == player.y then
			love.event.quit()
		end
	end
end