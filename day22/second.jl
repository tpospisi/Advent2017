function day22b(fname = "input.txt")
    turn_right = Dict((1,0) => (0, -1),
                      (0,-1) => (-1, 0),
                      (-1, 0) => (0, 1),
                      (0,1) => (1, 0))

    turn_left = Dict((0, -1) => (1,0),
                     (-1, 0) =>(0,-1),
                     (0, 1) => (-1, 0),
                     (1, 0)=> (0,1))

    infected = Set()
    lines = readlines(fname)
    for (row, line) in enumerate(lines), (col, char) in enumerate(line)
        char == '#' && push!(infected, (row, col))
    end

    weakened = Set()
    flagged = Set()

    mid = div(length(lines) + 1, 2)
    x, y = mid, mid
    dx, dy = -1, 0

    tot = 0
    for ii in 1:10000000
        if in((x, y), infected)
            dx, dy = turn_right[dx, dy]
            delete!(infected, (x, y))
            push!(flagged, (x, y))
        elseif in((x,y), weakened)
            delete!(weakened, (x, y))
            push!(infected, (x, y))
            tot += 1
        elseif in((x,y), flagged)
            dx, dy = -dx, -dy
            delete!(flagged, (x, y))
        else # clean
            dx, dy = turn_left[dx, dy]
            push!(weakened, (x, y))
        end
        x += dx
        y += dy
    end
    return tot
end

using Base.Test
@test day22b() == 2512028
