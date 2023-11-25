function enemiesLoad()
    e1 = Slime(600, 400, 0.35)
    e2 = GreenGuy(300, 350, 0.5)
end

function enemiesUpdate(dt)
    e1.update(e1, dt)
    e2.update(e2, dt)
    
end

function enemiesDraw()
    e1.draw(e1)
    e2.draw(e2)
end
