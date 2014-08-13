Boundary = {}



function Boundary:new()
	local o = {}
	local mt = {__index = self}
	setmetatable(o, mt)
	return o
end

function Boundary:draw()
	love.graphics.setColor(0,0,0,255)
	love.graphics.circle("line", 200,55,55,100)
end