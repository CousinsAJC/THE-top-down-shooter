Gun = Weapon:extend()

function Gun:new(range, rate, damage, speed)
    Gun.super.new(self, range, rate, damage, speed)
    self.image = love.graphics.newImage("assets/sprites/gun.png")
    self.type = "Gun"
    self.ammoImage = love.graphics.newImage("assets/sprites/bullet.png")
    self.centerX = (self.image:getWidth() / 2) * self.scaleX
    self.centerY = (self.image:getHeight() / 2) * self.scaleY
end
