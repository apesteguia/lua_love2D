function moveStars(dt)
    for i, v in ipairs(stars) do
        stars[i][2] = stars[i][2] + 100 * dt
    end
end

function moveEnemy(dt)
    for i, v in ipairs(enemies) do
        v.y = v.y + 100 * dt
    end
end

function movePlayer(dt)
    if love.keyboard.isDown("space") then
        love.event.quit()
    end
    if player.x > 0 and player.x < windowWidth - player.w and player.y > 0 and player.y < windowHeight - player.h then
        if love.keyboard.isDown("d") and love.keyboard.isDown("w") then
            player.x = player.x + player.speed * dt * 0.3
            player.y = player.y - player.speed * dt * 0.3
        elseif love.keyboard.isDown("d") and love.keyboard.isDown("s") then
            player.x = player.x + player.speed * dt * 0.3
            player.y = player.y + player.speed * dt * 0.5
        elseif love.keyboard.isDown("a") and love.keyboard.isDown("s") then
            player.x = player.x - player.speed * dt * 0.3
            player.y = player.y + player.speed * dt * 0.5
        elseif love.keyboard.isDown("a") and love.keyboard.isDown("w") then
            player.x = player.x + player.speed * dt * 0.3
            player.y = player.y - player.speed * dt * 0.5
        end

        if love.keyboard.isDown("d") then
            player.x = player.x + player.speed * dt
        elseif love.keyboard.isDown("a") then
            player.x = player.x - player.speed * dt
        elseif love.keyboard.isDown("w") then
            player.y = player.y - player.speed * dt
        elseif love.keyboard.isDown("s") then
            player.y = player.y + player.speed * dt
        end
   else
        if player.x < 0 then
            player.x = 1
        elseif player.x > windowWidth -  player.w - 1 then
            player.x = windowWidth - 1 - player.w
        elseif player.y < 0 then
            player.y = 1
        elseif player.y > windowHeight - player.h - 1 then
            player.y = windowHeight - 1 - player.h
        end
   end
end

