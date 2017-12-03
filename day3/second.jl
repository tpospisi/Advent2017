function neighbor_sum(grid, x, y)
    return sum(get(grid, (x + dx, y + dy), 0) for dx in -1:1, dy in -1:1)
end
    
function day3b(input = 277678)
    x, y = 1, 0
    ii = 2
    level = 1
    dx, dy = 0, 1

    grid = Dict((0,0) => 1)
    while true
        grid[x, y] = neighbor_sum(grid, x, y)
        if grid[x, y] > input
            return grid[x, y]
        elseif x == level && y == level
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
            grid[x, y] = neighbor_sum(grid, x, y)
        end

        ii += 1
        x += dx
        y += dy
    end
end

day3b()
