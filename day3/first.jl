function day3a(input = 277678)
    x, y = 1, 0
    ii = 2
    level = 1
    dx, dy = 0, 1

    while ii < input
        if x == level && y == level
            dx, dy = -1, 0
        elseif x == -level && y == level
            dx, dy = 0, -1
        elseif x == -level && y == -level
            dx, dy = 1, 0
        elseif x == level && y == -level
            dx, dy = 0, 1
            level += 1

            # move to next level
            ii += 1
            x += 1
        end

        ii += 1
        x += dx
        y += dy
    end

    return abs(x) + abs(y)
end

day3a()
