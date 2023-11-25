function cursor_load()
    myCursor = {}
    myCursor.image = love.graphics.newImage("assets/sprites/crosshairs.png")
    myCursor.x = love.mouse.getX()
    myCursor.y = love.mouse.getY()
    myCursor.scaleX = 1.5
    myCursor.scaleY = 1.5
    love.mouse.setVisible(false)
    trueMouseX = love.mouse.getX()
    trueMouseY = love.mouse.getY()
end


function cursor_update()
    myCursor.x = love.mouse.getX()
    myCursor.y = love.mouse.getY() 
    myCursor.centerX = myCursor.x - ((myCursor.image:getWidth() / 2) * myCursor.scaleX)
    myCursor.centerY = myCursor.y - ((myCursor.image:getHeight() / 2) * myCursor.scaleY)
    trueMouseX = love.mouse.getX()
    trueMouseY = love.mouse.getY()
end

function cursor_draw()
    love.graphics.draw(myCursor.image, myCursor.centerX, myCursor.centerY, nil, myCursor.scaleX, myCursor.scaleY)
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.circle("fill", trueMouseX, trueMouseY, 3)
end
