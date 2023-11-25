function weaponsLoad()
    gun1 = Gun(500, 0.07, 100, 700)
    rocket1 = Rocket_Launcher(250, 0.75, 250, 350)
end



function weaponsUpdate(dt)
    rocket1.update(rocket1, p1.centerX, p1.centerY, dt)
    gun1.update(gun1, p1.centerX, p1.centerY, dt)
end



function weaponsDraw()
    if p1.weapon == "rocket1" then
        rocket1.draw(rocket1, p1)
    elseif p1.weapon == "gun1" then
        gun1.draw(gun1, p1)
    end
end
