function fire(player, weapon, x, y, button, ox, oy)
    local startX = ox
    local startY = oy
    local mouseX = x
    local mouseY = y
    local ammoCenterX = weapon.ammoImage:getWidth() / 2
    local ammoCenterY = weapon.ammoImage:getWidth() / 2

    local angle = math.atan2((mouseY - startY), (mouseX - startX))
    local ammoDX = weapon.speed * math.cos(angle)
    local ammoDY = weapon.speed * math.sin(angle)

    ammo_direction = findRotation(p1.centerX, p1.centerY, x, y)

    table.insert(player.ammo, {x = startX, y = startY, dx = ammoDX, dy = ammoDY, ad = ammo_direction, wi = weapon.ammoImage, cx = ammoCenterX, cy = ammoCenterY})
end