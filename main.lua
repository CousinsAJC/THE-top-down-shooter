WINDOW_WIDTH, WINDOW_HEIGHT = 1366, 768

function love.load()
    require "requires"

    love.graphics.setDefaultFilter("nearest", "nearest")

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        borderless = true,
        vsync = true
    })

    cam = camera()

    cursor_load()

    p1 = Player(50, 50, "p1")
    weaponsLoad()
    enemiesLoad()
end


function love.update(dt)
    cursor_update()
    p1.update(p1, dt)
    weaponsUpdate(dt)
    enemiesUpdate(dt)

    cam:lookAt(p1.centerX, p1.centerY)
end


function love.draw()

    cam:attach()
        love.graphics.setColor(1, 1, 1, 1)
        p1.draw(p1)
        weaponsDraw()
        enemiesDraw()
        cursor_draw()
    cam:detach()

end
