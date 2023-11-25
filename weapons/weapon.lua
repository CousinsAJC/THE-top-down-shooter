Weapon = Object:extend()

function Weapon:new(range, rate, damage, speed)
    self.range = range
    self.rate = rate
    self.damage = damage
    self.lastAmmo = 0
    self.speed = speed
    self.scaleX = 1
    self.scaleY = 1
end

function Weapon.update(self, ox, oy, dt)
    weapon_direction = findRotation(ox, oy, myCursor.centerX, myCursor.centerY)

    if p1.weapon == "rocket1" then
        self.scaleX = 1.25
        self.scaleY = 1.25
    elseif p1.weapon == "gun1" then
        self.scaleX = 0.85
        self.scaleY = 0.85
    end
end

function Weapon.draw(self, owner)
    love.graphics.draw(self.image, owner.centerX, owner.centerY, weapon_direction, self.scaleX, self.scaleY, self.centerX, self.centerY)
end

