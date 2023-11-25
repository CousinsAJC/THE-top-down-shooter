function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
        love.event.quit()
    end

    if key == "tab" then
        if p1.weapon == "rocket1" then
            p1.weapon = "gun1"
        elseif p1.weapon == "gun1" then
            p1.weapon = "rocket1"
        end
    end
end



function love.mousepressed(x, y, button, dt)
    if button == 1 then
        if p1.weapon == "rocket1" then
            if rocket1.lastAmmo == 0 then
                rocket1.lastAmmo = love.timer.getTime()
                fire(p1, rocket1, x, y, button, p1.centerX, p1.centerY)
            else
                time = love.timer.getTime()
                time = time - rocket1.rate
                if time > rocket1.lastAmmo then
                    fire(p1, rocket1, x, y, button, p1.centerX, p1.centerY)
                    rocket1.lastAmmo = love.timer.getTime()
                end
            end
        elseif p1.weapon =="gun1" then
            if gun1.lastAmmo == 0 then
                gun1.lastAmmo = love.timer.getTime()
                fire(p1, gun1, x, y, button, p1.centerX, p1.centerY)
            else
                time = love.timer.getTime()
                time = time - gun1.rate
                if time > gun1.lastAmmo then
                    fire(p1, gun1, x, y, button, p1.centerX, p1.centerY)
                    gun1.lastAmmo = love.timer.getTime()
                end
            end
        end
    end
end