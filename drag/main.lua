require("shape")
require("boundary")

function love.load()
	love.graphics.setBackgroundColor(255, 255, 255, 255)
	circle = Shape:new()
	circleBoundary = Boundary:new()
end

function love.draw()
	circle:draw()
	circleBoundary:draw()
end

function love.update()
	circle:update()
	circleBoundary:draw()

end

function love.keypressed(key)
	if( key == 'escape') then
		love.event.quit()
	end
end

function love.mousepressed(x,y,button)
	if(button == "l") then
		circle:dragActivate(x,y)
	end
end

function love.mousereleased(x,y,button)
	if  button == "l" then
		circle:dragDeactivate()
	end
end