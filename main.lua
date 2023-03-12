package.path = package.path .. ";./?.lua;./?/init.lua"
love.math = require("love.math")
require("move")
require("generate")
require("checkCollision")
require("optimization")
require("gameOver")

function love.load()
    windowWidth = 1000
    windowHeight = 600
    love.window.setMode(windowWidth, windowHeight, {
        resizable = false,
        vsync = true,
        fullscreen = false,
        centered = true
    })
    font1 = love.graphics.newFont(32)
    font2 = love.graphics.newFont(16)
    font3 = love.graphics.newFont(100)
    love.graphics.setFont(font1)
    r, g, b = 1, 1, 1
    timer = 0
    score = 0
    startTime = love.timer.getTime()
    i = true
    stars = {}
    enemies = {}
    player = {}
    mode = "easy"
    gameOver = false
    gameWin = false
    speed = 200
end

function love.update(dt)
    if gameOver == false and gameWin == false then
        local x = 0
        timer = timer + dt
        score = math.floor((love.timer.getTime() + startTime) / 1)
        moveStars(dt)
        moveEnemy(speed, dt)
        deleteEnemies()
        deleteStars()
        checkCollision(dt)
        if timer >= 1 and x < 10 then
            r, g, b = love.math.random(), love.math.random(), love.math.random()
            generateEnemy(440)
            timer = 0
            x = x + 1
            speed = speed + 20
        end
        if i == true then
            createPlayer()
            generateStars()
            i = false
        end
        if score > 15 and score < 25 then
            mode = "medium"
        elseif score > 25 and score < 35 then
            mode = "hard"
        elseif score > 35 then
            mode = "god"
        elseif score == 69 then
            gameWin = true
        elseif score == 78 then
            love.event.quit()
        end
        movePlayer(dt)
    elseif gameOver == true or gameWin == true then
        exit()
    end
end

function love.draw(dt)
    if gameOver == false then
        love.graphics.points(stars)
        love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
        for i, v in ipairs(enemies) do
            --love.graphics.print("enemi1 " .. v.y, 20, 90)
            love.graphics.setColor(r, g, b)
            love.graphics.circle("fill", v.x, v.y, v.w, v.h)
            love.graphics.setColor(255, 255, 255)
        end
        love.graphics.setFont(font1)
        love.graphics.print("Score: " .. score, 20, 20)
        love.graphics.setFont(font2)
        love.graphics.print("Press SPACE to Exit", 800, 550)
        love.graphics.print("Mode: " .. mode, 30, 60)
        if mode == "win" then
            love.graphics.setFont(font3)
            love.graphics.print("YOU WIN!", 250, 100)
        end
    elseif gameOver == true then
        setGameOver()
    elseif gameWin == true then
        setWinGame()
    end
end
