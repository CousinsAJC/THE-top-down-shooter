function findRotation(x1, y1, x2, y2)
    return math.atan2(y2 - y1, x2 - x1)
end

function distanceFrom(x1,y1,x2,y2) 
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2) 
end