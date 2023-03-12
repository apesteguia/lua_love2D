function  setGameOver()
	local totalScore = score
	love.graphics.setFont(font3)
	love.graphics.print("GAME OVER", 220, 100)
	love.graphics.setFont(font1)
	love.graphics.print("Your Score: " .. totalScore, 400, 240)
	love.graphics.setFont(font2)
	love.graphics.print("Press SPACE to Exit", 430, 300)
end

function setWinGame()
	local totalScore = score
	love.graphics.setFont(font3)
	love.graphics.print("YOU WIN", 220, 100)
	love.graphics.setFont(font1)
	love.graphics.print("Your Score: " .. totalScore, 400, 240)
	love.graphics.setFont(font2)
	love.graphics.print("Press SPACE to Exit", 430, 300)
end

function exit()
	if love.keyboard.isDown("space") then
		love.event.quit()
	end
end
