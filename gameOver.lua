function  setGameOver()
	local totalScore = score
	love.graphics.setFont(font3)
	love.graphics.print("GAME OVER", 220, 100)
	love.graphics.setFont(font1)
	love.graphics.print("Your Score: " .. totalScore, 400, 240)
end

function exit()
	if love.keyboard.isDown("space") then
		love.event.quit()
	end
end
