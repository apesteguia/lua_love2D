function generateEnemy()
    local e = {}
    e.x = love.math.random(10, 1000)
    e.y = 10
    e.w = 60
    e.h = 60
    e.speed = 200
    table.insert(enemies, e)
end

function createPlayer()
    local p = {}
    p.x = love.graphics.getWidth() / 2.2
    p.y = love.graphics.getHeight() - 100
    p.w = 50
    p.h = 50
    p.speed = 220
    player = p
end

function generateStars()
    local screen_width, screen_height = love.graphics.getDimensions()
    local max_stars = 10000   -- how many stars we want

    for i=1, max_stars do   -- generate the coords of our stars
        local x = love.math.random(5, screen_width-5)
        local y = love.math.random(-20000, 600)
        stars[i] = {x, y}   -- stick the values into the table
    end
end
