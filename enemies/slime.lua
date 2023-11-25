Slime = Enemy:extend()

function Slime:new(x, y, speed)
    Slime.super.new(self, x, y, speed)
    self.sprite_Sheet = love.graphics.newImage("assets/sprites/slime2.png")

    self.grid = anim8.newGrid(49,49,196,196)

    self.animations = {}
    self.animations.down = anim8.newAnimation( self.grid("1-4", 1), 0.5)
    self.animations.left = anim8.newAnimation( self.grid("1-4", 2), 0.5)
    self.animations.right = anim8.newAnimation(self.grid("1-4", 3), 0.5)
    self.animations.up = anim8.newAnimation(self.grid("1-4", 4), 0.5)

    self.anim = self.animations.down
end


function Slime.draw(self)
    self.anim:draw(self.sprite_Sheet, self.x, self.y, nil, 1, 1)
end