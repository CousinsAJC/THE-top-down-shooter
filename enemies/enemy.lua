Enemy = Object:extend()

function Enemy:new(x, y, speed)
    self.x = x
    self.y = y
    self.speed = speed
    self.timer = 0
    self.isMoving = false
    self.moving = 0
    self.dir = 0

end



function Enemy.update(self, dt)
    self.move(self, dt)
    self.anim:update(dt)
end




function Enemy.move(self, dt)
    if self.timer <= 0 then
        self.dir = math.random(1, 8)
        self.timer = 90
    end

    if self.timer > 0 then
        self.timer = self.timer - 1
        if self.dir == 1 then
            self.y = self.y + self.speed
            self.x = self.x - self.speed
            self.anim = self.animations.down
        elseif self.dir == 2 then
            self.y = self.y + self.speed
            self.anim = self.animations.down
        elseif self.dir == 3 then
            self.y = self.y + self.speed
            self.x = self.x + self.speed
            self.anim = self.animations.right
        elseif self.dir == 4 then
            self.x = self.x + self.speed
            self.anim = self.animations.right
        elseif self.dir == 5 then
            self.y = self.y - self.speed
            self.x = self.x + self.speed
            self.anim = self.animations.up
        elseif self.dir == 6 then
            self.y = self.y - self.speed
            self.anim = self.animations.up
        elseif self.dir == 7 then
            self.y = self.y - self.speed
            self.x = self.x - self.speed
            self.anim = self.animations.left
        elseif self.dir == 8 then
            self.x = self.x - self.speed
            self.anim = self.animations.left
        end
    end

    --[[
    -- When timer is at 0 it's time to decide what to do
    if self.timer <= 0  and isMoving == true then
        self.timer = 20
        isMoving = false
    elseif self.timer <=0 and isMoving == false then
        --roll for instructions
        self.moving = math.random(1, 2)
        --if 1, then we should idle for .75 seconds.
        if self.moving == 1 then
            self.timer = 45
        elseif self.moving == 2 then
            self.dir = math.random(1, 9)
            self.isMoving = true
        end
        
    --if we have timer to count and not moving then we idle til timer is done.        
    elseif self.timer > 0 and self.isMoving == false then
        self.timer = self.timer - 1
        self.anim:gotoFrame(2)
    elseif self.timer > 0 and self.isMoving == true then
        self.timer = self.timer - 1

        if self.dir == 1 or self.dir == 4 or self.dir == 7 then
            self.x = self.x - self.speed
            self.anim = self.animations.left
        elseif self.dir == 3 or self.dir == 6 or self.dir == 9 then
            self.x = self.x + self.speed
            self.anim = self.animations.right
        end


        if self.dir == 1 or self.dir == 2 or self.dir == 3 then
            self.y = self.y + self.speed
            self.anim = self.animations.down
        elseif self.dir == 7 or self.dir == 8 or self.dir == 9 then
            self.y = self.y - self.speed
            self.anim = self.animations.up
        end
    end
    ]]
end



