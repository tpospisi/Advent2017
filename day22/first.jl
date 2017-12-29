function day22a(fname = "input.txt")
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

    mid = div(length(lines) + 1, 2)
    x, y = mid, mid
    dx, dy = -1, 0

    tot = 0
    for ii in 1:10000
        if in((x, y), infected)
            dx, dy = turn_right[dx, dy]
            delete!(infected, (x, y))
        else
            dx, dy = turn_left[dx, dy]
            push!(infected, (x, y))
            tot += 1
        end
        x += dx
        y += dy
    end
    return tot
end
