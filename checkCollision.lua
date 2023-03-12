function checkCollision(dt)
	for i, v in ipairs(enemies) do
        local closestX = math.max(player.x, math.min(v.x, player.x + player.w))
        local closestY = math.max(player.y, math.min(v.y, player.y + player.h))
        local distanceX = v.x - closestX
        local distanceY = v.y - closestY
        local distance = math.sqrt(distanceX * distanceX + distanceY * distanceY)
        if distance < v.w then
            gameOver = true
        end
	end
end
