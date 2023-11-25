GreenGuy = Enemy:extend()

function GreenGuy:new(x, y, speed)
    GreenGuy.super.new(self, x, y, speed)
    self.sprite_Sheet = love.graphics.newImage("assets/sprites/green_guy.png")

    self.grid = anim8.newGrid(49,49,147,196)

    self.animations = {}
    self.animations.down = anim8.newAnimation( self.grid("1-3", 1), 0.5)
    self.animations.left = anim8.newAnimation( self.grid("1-3", 2), 0.5)
    self.animations.right = anim8.newAnimation(self.grid("1-3", 3), 0.5)
    self.animations.up = anim8.newAnimation(self.grid("1-3", 4), 0.5)

    self.anim = self.animations.down
end

function GreenGuy.draw(self)
    self.anim:draw(self.sprite_Sheet, self.x, self.y, nil, 1.5, 1.5)
end