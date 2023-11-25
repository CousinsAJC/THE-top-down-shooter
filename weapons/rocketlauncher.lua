Rocket_Launcher = Weapon:extend()

function Rocket_Launcher:new(range, rate, damage, speed)
    Rocket_Launcher.super.new(self, range, rate, damage, speed)
    self.image = love.graphics.newImage("assets/sprites/rocket_launcher.png")
    self.type = "Rocket Launcher"
    self.ammoImage = love.graphics.newImage("assets/sprites/rocket.png")
    self.centerX = self.image:getWidth() / 2
    self.centerY = self.image:getHeight() / 2
end
