function cursor_load()
    myCursor = {}
    myCursor.image = love.graphics.newImage("assets/sprites/crosshairs.png")
    myCursor.x = love.mouse.getX()
    myCursor.y = love.mouse.getY()
    myCursor.scaleX = 1.5
    myCursor.scaleY = 1.5
    myCursor.targetImage = love.graphics.newImage("assets/sprites/target.png")
    love.mouse.setVisible(false)
    trueMouseX = love.mouse.getX()
    trueMouseY = love.mouse.getY()
end


function cursor_update()
    myCursor.x = love.mouse.getX()
    myCursor.y = love.mouse.getY() 
    myCursor.centerX = myCursor.x - ((myCursor.image:getWidth() / 2) * myCursor.scaleX)
    myCursor.centerY = myCursor.y - ((myCursor.image:getHeight() / 2) * myCursor.scaleY)

    cursorDistance = distanceFrom(myCursor.x, myCursor.y, p1.centerX, p1.centerY)
    cursorAngle = findRotation(myCursor.x, myCursor.y, p1.centerX, p1.centerY)

    myCursor.cos = math.cos(cursorAngle)
    myCursor.sin = math.sin(cursorAngle)

    
    if p1.weapon == "rocket1" then
        if cursorAngle == 0 then
            if math.abs(cursorDistance) > rocket1.range then
                trueMouseX = player1.centerX - rocket1.range
                trueMouseY = player1.centerY
            else
                trueMouseX = myCursor.centerX
                trueMouseY = myCursor.centerY
            end
        elseif cursorAngle == 90 then
            if math.abs(cursorDistance) > rocket1.range then
                trueMouseX = player1.centerX
                trueMouseY = player1.centerY - rocket1.range
            else
                trueMouseX = myCursor.centerX
                trueMouseY = myCursor.centerY
            end            
        elseif cursorAngle == 180 then
            if math.abs(cursorDistance) > rocket1.range then
                trueMouseX = player1.centerX + rocket1.range
                trueMouseY = player1.centerY
            else
                trueMouseX = myCursor.centerX
                trueMouseY = myCursor.centerY
            end  
        elseif cursorAngle == -90 then
            if math.abs(cursorDistance) > rocket1.range then
                trueMouseX = player1.centerX
                trueMouseY = player1.centerY + rocket1.range
            else
                trueMouseX = myCursor.centerX
                trueMouseY = myCursor.centerY
            end   
        else
            if cursorAngle > 0 and cursorAngle < 90 then
                if math.abs(cursorDistance) > rocket1.range then
                    local xdist = myCursor.cos * -rocket1.range
                    local ydist = myCursor.sin * -rocket1.range
                    trueMouseX = p1.x + xdist
                    trueMouseY = p1.y + ydist
                else
                    trueMouseX = myCursor.centerX
                    trueMouseY = myCursor.centerY
                end
            elseif cursorAngle > 90 and cursorAngle < 180 then
                if math.abs(cursorDistance) > rocket1.range then
                    local xdist = myCursor.cos * rocket1.range
                    local ydist = myCursor.sin * -rocket1.range
                    trueMouseX = p1.x - xdist
                    trueMouseY = p1.y + ydist
                else
                    trueMouseX = myCursor.centerX
                    trueMouseY = myCursor.centerY
                end
            elseif cursorAngle < 180 and cursorAngle < -90 then
                if math.abs(cursorDistance) > rocket1.range then
                    local xdist = myCursor.cos * rocket1.range
                    local ydist = myCursor.sin * rocket1.range
                    trueMouseX = p1.x - xdist
                    trueMouseY = p1.y - ydist
                else
                    trueMouseX = myCursor.centerX
                    trueMouseY = myCursor.centerY
                end
            elseif cursorAngle > -90 and cursorAngle < 0 then
                if math.abs(cursorDistance) > rocket1.range then
                    local xdist = myCursor.cos * -rocket1.range
                    local ydist = myCursor.sin * rocket1.range
                    trueMouseX = p1.x + xdist
                    trueMouseY = p1.y - ydist
                else
                    trueMouseX = myCursor.centerX
                    trueMouseY = myCursor.centerY
                end
            end
        end


    elseif p1.weapon == "gun1" then
        if cursorAngle == 0 then
            if math.abs(cursorDistance) > gun1.range then
                trueMouseX = player1.centerX - gun1.range
                trueMouseY = player1.centerY
            else
                trueMouseX = myCursor.centerX
                trueMouseY = myCursor.centerY
            end
        elseif cursorAngle == 90 then
            if math.abs(cursorDistance) > gun1.range then
                trueMouseX = player1.centerX
                trueMouseY = player1.centerY - gun1.range
            else
                trueMouseX = myCursor.centerX
                trueMouseY = myCursor.centerY
            end            
        elseif cursorAngle == 180 then
            if math.abs(cursorDistance) > gun1.range then
                trueMouseX = player1.centerX + gun1.range
                trueMouseY = player1.centerY
            else
                trueMouseX = myCursor.centerX
                trueMouseY = myCursor.centerY
            end  
        elseif cursorAngle == -90 then
            if math.abs(cursorDistance) > gun1.range then
                trueMouseX = player1.centerX
                trueMouseY = player1.centerY + gun1.range
            else
                trueMouseX = myCursor.centerX
                trueMouseY = myCursor.centerY
            end   
        else
            if cursorAngle > 0 and cursorAngle < 90 then
                if math.abs(cursorDistance) > gun1.range then
                    local xdist = myCursor.cos * -gun1.range
                    local ydist = myCursor.sin * -gun1.range
                    trueMouseX = p1.x + xdist
                    trueMouseY = p1.y + ydist
                else
                    trueMouseX = myCursor.centerX
                    trueMouseY = myCursor.centerY
                end
            elseif cursorAngle > 90 and cursorAngle < 180 then
                if math.abs(cursorDistance) > gun1.range then
                    local xdist = myCursor.cos * gun1.range
                    local ydist = myCursor.sin * -gun1.range
                    trueMouseX = p1.x - xdist
                    trueMouseY = p1.y + ydist
                else
                    trueMouseX = myCursor.centerX
                    trueMouseY = myCursor.centerY
                end
            elseif cursorAngle < 180 and cursorAngle < -90 then
                if math.abs(cursorDistance) > gun1.range then
                    local xdist = myCursor.cos * gun1.range
                    local ydist = myCursor.sin * gun1.range
                    trueMouseX = p1.x - xdist
                    trueMouseY = p1.y + ydist
                else
                    trueMouseX = myCursor.centerX
                    trueMouseY = myCursor.centerY
                end
            elseif cursorAngle > -90 and cursorAngle < 0 then
                if math.abs(cursorDistance) > gun1.range then
                    local xdist = myCursor.cos * -gun1.range
                    local ydist = myCursor.sin * gun1.range
                    trueMouseX = p1.x + xdist
                    trueMouseY = p1.y - ydist
                else
                    trueMouseX = myCursor.centerX
                    trueMouseY = myCursor.centerY
                end
            end
        end
    end
end

function cursor_draw()
    love.graphics.draw(myCursor.image, myCursor.centerX, myCursor.centerY, nil, myCursor.scaleX, myCursor.scaleY)
    --love.graphics.draw(myCursor.targetImage, trueMouseX, trueMouseY, nil, 1.5, 1.5)
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.circle("fill", myCursor.x, myCursor.y, 3)
    love.graphics.print(cursorDistance, p1.x + 20, p1.y - 40)
    love.graphics.print(math.deg(cursorAngle), p1.x + 20, p1.y + 100)
end
