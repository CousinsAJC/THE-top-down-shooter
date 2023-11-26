Player = Object:extend()

function Player:new(x, y, charNum)
    --Player variables to track
    self.x = x
    self.y = y
    self.char = charNum
    self.speed = 200
    self.weapon = "rocket1"
    self.scale= 1.5
    self.centerX = self.x + (24 * self.scale)
    self.centerY = self.y + (24 * self.scale)


    --ammo table for shots fired by player1
    self.ammo = {}
    self.ammoScale = 1.5


    --sprites and animation table for all of player 1s actions taken
    self.sprite_Sheet = love.graphics.newImage("assets/sprites/player.png")
    self.grid = anim8.newGrid(48,48,192,192)

    self.animations = {}
    self.animations.down = anim8.newAnimation( self.grid("1-4", 1), 0.2)
    self.animations.left = anim8.newAnimation( self.grid("1-4", 2), 0.2)
    self.animations.right = anim8.newAnimation(self.grid("1-4", 3), 0.2)
    self.animations.up = anim8.newAnimation(self.grid("1-4", 4), 0.2)

    self.anim = self.animations.down
end




function Player.update(self, dt)
    --adjust the center of the Player based on movement and scaled player image
    self.centerX = self.x + (24 * self.scale)
    self.centerY = self.y + (24 * self.scale)

    --get player movement whether keyboard/mouse or controller
    delta = self.controller(self, dt)
    self.move(self, delta, dt)

    --update player animatons based on player movement
    self.anim:update(dt)

    --update players shots fired positionin ammo table
    for i,v in ipairs(self.ammo) do
        v.x = v.x + (v.dx * dt)
        v.y = v.y + (v.dy * dt)
    end
end




function Player.draw(self)
    --Draw player animation
    self.anim:draw(p1.sprite_Sheet, p1.x, p1.y, nil, self.scale, self.scale)

    --draw table of ammunition fired
    for i,v in ipairs(self.ammo) do
        love.graphics.draw(v.wi, v.x, v.y, v.ad, self.ammoScale,self.ammoScale, v.cx, v.cy)
    end

end



function Player.move(self, delta, dt)

    --getmovement from keyboard
    local lastPress = 0
    local isMoving = false
    local pace = self.speed * dt

    --make diagonal movement feel more in line with vert/horiz movement
    if (love.keyboard.isDown("a") or love.keyboard.isDown("d")) and (love.keyboard.isDown("w") or love.keyboard.isDown("s")) then
        pace = pace * 0.85
    end
    if (delta.x < -0.25 or delta.x > 0.25) and (delta.y < -0.25 or delta.y > 0.25) then
        pace = pace * 0.85
    end

    --accept input, move player, play animation
    if love.keyboard.isDown("a") or delta.x < -0.25 then
        self.x = self.x - pace
        self.anim = self.animations.left
        isMoving = true
    end

    if love.keyboard.isDown("w") or delta.y < -0.25 then
        self.y = self.y - pace
        self.anim = self.animations.up
        isMoving = true
    end

    if love.keyboard.isDown("s") or delta.y > 0.25 then
        self.y = self.y + pace
        self.anim = self.animations.down
        isMoving = true
    end

    if love.keyboard.isDown("d") or delta.x > 0.25 then
        self.x = self.x + pace
        self.anim = self.animations.right
        isMoving = true
    end

    if isMoving == false then
        self.anim:gotoFrame(2)
    end
end



function Player.controller(self, dt)

    --get movement if using a gamepad/controller
    local delta = {x = 0, y = 0}
    local joysticks = love.joystick.getJoysticks()

    if self.char == "p1" then
        if #joysticks > 0 then
            local xaxis = joysticks[1]:getAxis(1)
            local yaxis = joysticks[1]:getAxis(2)
            delta.x = xaxis
            delta.y = yaxis
        end

    elseif self.char == "p2" then
        if #joysticks > 1 then
            local xaxis = joysticks[2]:getAxis(1)
            local yaxis = joysticks[2]:getAxis(2)
            delta.x = xaxis
            delta.y = yaxis
        end
    end
    return delta
end

