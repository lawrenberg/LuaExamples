Shape = {}

Shape.x = 50
Shape.y = 50
Shape.r = 50
Shape.drag = false
Shape.dragging = {diffX = 0 , diffY = 0}
Shape.centerPt = { x = 0, y = 0}

function Shape:new()
	local o = {}
	local mt = {__index = self}
	setmetatable(o, mt)
	return o
end

function Shape:draw()
	love.graphics.setColor(255, 0,0,255)
	love.graphics.circle("fill", self.x, self.y, 50, 150)
end

function Shape:update(dt)
	self:handleEvent()
end

function Shape:handleEvent()
	if self.drag then
		mx = love.mouse.getX()
		my = love.mouse.getY()

		cx = self.x
		cy = self.y
		cw = self.r * 2
		ch = cw
		--right and left
		if cx <= mx and ((cx <= mx) and ((cx + cw) >= mx))then
			self.x = mx - self.dragging.diffX
		elseif ((cx > mx) and ((cx + cw) >= mx)) then
			self.x = mx + self.dragging.diffX
		end

		-- down and up
		if ((cy <= my) and (cy + ch) >= my) then
			self.y = my - self.dragging.diffY 
		elseif ((cy > my) and (cy + ch) >= my) then
			self.y = my + self.dragging.diffY
		end
	end
end

function Shape:dragActivate(x,y)
	self.drag = true
	self.dragging.diffX = x - self.x
	self.dragging.diffY = y - self.y
end

function Shape:dragDeactivate()
	self.drag = false
end