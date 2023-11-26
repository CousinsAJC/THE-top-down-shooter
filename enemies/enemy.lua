Enemy = Object:extend()

function Enemy:new(x, y, speed)
    self.x = x
    self.y = y
    self.baseSpeed = speed
    self.speed = speed
    self.timer = 0
    self.chaseTimer = 0
    self.isMoving = false
    self.moving = 0
    self.dir = 0
    self.foundPlayer = false
end



function Enemy.update(self, dt)
    self.move(self, dt)
    self.anim:update(dt)
end




function Enemy.move(self, dt)
    if distanceFrom(self.x + 24.5, self.y + 24.5, p1.centerX, p1.centerY) < 300 then
        if self.foundPlayer == false then
            sfx.huh:play()
            self.chaseTimer = 10
            self.shock = true
            self.foundPlayer = true
        else
            self.chaseTimer = self.chaseTimer - 1
            if self.chaseTimer == 0 then
                self.shock = false
                self.foundPlayer = true
            end
        end
    else
        self.foundPlayer = false
    end


    if self.foundPlayer == false then
        if self.timer <= 0 then
            self.speed = 2 * self.baseSpeed
            self.dir = math.random(1, 8)
            self.timer = 120
        end
    elseif self.foundPlayer == true then
        self.speed = 4 * self.baseSpeed
        local angle = math.atan2((p1.y - self.y), (p1.x - self.x))
        self.dx = self.speed * math.cos(angle)
        self.dy = self.speed * math.sin(angle)
        self.x = self.x + self.dx
        self.y = self.y + self.dy

        if self.dy <= 0 and self.dx <= 0 then
            if self.dx < self.dy then
                self.anim = self.animations.left
            else
                self.anim = self.animations.up
            end
        elseif self.dy <=0 and self.dx > 0 then
            if math.abs(self.dy) > self.dx then
                self.anim = self.animations.up
            else
                self.anim = self.animations.right
            end
        elseif self.dy > 0 and self.dx <= 0 then
            if self.dy > math.abs(self.dx) then
                self.anim = self.animations.down
            else
                self.anim = self.animations.left
            end
        elseif self.dy > 0 and self.dx > 0 then
            if self.dy > self.dx then
                self.anim = self.animations.down
            else
                self.anim = self.animations.right
            end
        end
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



