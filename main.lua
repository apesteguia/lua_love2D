package.path = package.path .. ";./?.lua;./?/init.lua"
function love.load()
    windowWidth = 1000
    windowHeight = 600
    love.window.setMode(windowWidth, windowHeight, {
            resizable = false,
            vsync = true,
            fullscreen = false,
            centered = true
        })
    timer = 0
    i = true
    stars = {}
    enemies = {}
    player = {}
end

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

function moveStars(dt)
    for i, v in ipairs(stars) do
        stars[i][2] = stars[i][2] + 100 * dt
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
        elseif player.x > windowWidth - player.w - 1 then
            player.x = windowWidth - 1 - player.w
        elseif player.y < 0 then
            player.y = 1
        elseif player.y > windowHeight - player.h - 1 then
            player.y = windowHeight - 1 - player.h
        end
   end
end

function love.update(dt)
    timer = timer + dt
    moveStars(dt)
    if timer >= 2 then
        generateEnemy()
        timer = 0
    end
    if i == true then
        createPlayer()
        generateStars()
        i = false
    end
    
    movePlayer(dt)
end

function love.draw(dt)
    love.graphics.points(stars)
    love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
    for i, v in ipairs(enemies) do
        love.graphics.setColor(255, 0, 0)
        love.graphics.circle("fill", v.x, v.y, v.w, v.h)
        love.graphics.setColor(255, 255, 255)
    end
end


--[[
function love.draw()
    love.graphics.circle("fill", rect.x, rect.y, rect.width, rect.heigth)
end

function love.load()
    rect = {}
    rect.x = 100
    rect.y = 100
    rect.width = 20
    rect.heigth = 20
    rect.coord = {true, false, false, false}
    --derecha izquierda arriba abajo
end

function setFalse(tabla)
    for i, _ in ipairs(tabla) do
        tabla[i] = false
    end
end

function love.keypressed(key)
    if key == "down" then
        setFalse(rect.coord)
        rect.coord[4] = true
    elseif key == "up" then
        setFalse(rect.coord)
        rect.coord[3] = true
    elseif key == "right" then
        setFalse(rect.coord)
        rect.coord[1] = true
    elseif key == "left" then
        setFalse(rect.coord)
        rect.coord[2] = true
    elseif key == "space" then
        rect.width = rect.width + 5
        rect.heigth = rect.heigth + 5
    end
end

function love.update(dt)
    if rect.coord[1] == true then
        rect.x = rect.x + 200 * dt
        if rect.x == 600 then
            setFalse(rect.coord)
            rect.coord[2] = true
        end
    elseif rect.coord[2] == true then
        rect.x = rect.x - 200 * dt
    elseif rect.coord[4] == true then
        rect.y = rect.y + 200 * dt
    elseif rect.coord[3] == true then
        rect.y = rect.y - 200 * dt
    end
end


mouse = false

function love.load()
    elementos = {}
end

function love.draw(dt)
    for i, v in ipairs(elementos) do
        --love.graphics.circle("fill", v.x, v.y, v.w, v.h)
          love.graphics.arc( "fill", 400, 300, 100, 0, math.pi )
    end
end

function añadirElementos()
    local tamaño = 10
    e = {}
    e.x = love.mouse.getX()
    e.y = love.mouse.getY()
    e.w = tamaño
    e.h = tamaño

    table.insert(elementos, e)
end

function love.mousepressed()
    mouse = true
end

function love.mousereleased()
    mouse = false
end

function love.update(dt)
    if mouse == true then
        añadirElementos()
    end
end



function love.load()
    love.window.setMode(1000, 600, {
            resizable = false,
            vsync = true,
            fullscreen = false,
            centered = true
        })
    timer = 0
    i = true
    stars = {}
    enemigos = {}
    player = {}
end

function createPlayer()
    p = {}
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

function moveStars(dt)
    for i, v in ipairs(stars) do
        stars[i][2] = stars[i][2] + 100 * dt
    end
end

function movePlayer(dt)
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed * dt
    elseif love.keyboard.isDown("left") then
        player.x = player.x - player.speed * dt
    elseif love.keyboard.isDown("up") then
        player.y = player.y - player.speed * dt
    elseif love.keyboard.isDown("down") then
        player.y = player.y + player.speed * dt
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
end

function love.update(dt)
    movePlayer(dt)
    timer = timer + dt
    moveStars(dt)
    if i == true then
        createPlayer()
        generateStars()
        i = false
    end

end

function love.draw(dt)
    love.graphics.points(stars)
    love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
end

--[[

function love.load()
    timer = 0
    stars = {}
end
function generateStars()
    local screen_width, screen_height = love.graphics.getDimensions()
    local max_stars = 50   -- how many stars we want

    for i=1, max_stars do   -- generate the coords of our stars
        local x = love.math.random(5, screen_width-5)
        local y = love.math.random(5, screen_width-5)
        stars[i] = {x, y}   -- stick the values into the table
    end
end

function moveStars(dt)
    for i, v in ipairs(stars) do
        stars[i][2] = stars[i][2] + 100 * dt
    end
end

function love.update(dt)
    timer = timer + dt
    moveStars(dt)
    if timer >= 1 then
        generateStars()
        timer = 0
    end
end

function love.draw()
    love.graphics.points(stars)
end


--[[


function love.load()
  -- Inicializar el temporizador a 0
  timer = 0

  -- Crear una lista vacía de objetos
  objects = {}
end

function love.update(dt)
  -- Incrementar el temporizador por dt
  timer = timer + dt

  -- Si el temporizador ha alcanzado los 2 segundos, crear un nuevo objeto
  if timer >= 2 then
    table.insert(objects, {x = math.random(0, love.graphics.getWidth()), y = math.random(0, love.graphics.getHeight())})
    timer = 0
  end
end

function love.draw()
  -- Dibujar todos los objetos en la lista
  for i, object in ipairs(objects) do
    love.graphics.rectangle("fill", object.x, object.y, 50, 50)
  end
end

--]]
