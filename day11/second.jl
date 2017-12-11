function day11b(fname = "input.txt")
    dir2vec = Dict("n"  => [ 1,  0, -1],
                   "ne" => [ 0,  1, -1],
                   "se" => [-1,  1,  0],
                   "s"  => [-1,  0,  1],
                   "sw" => [ 0, -1,  1],
                   "nw" => [ 1, -1,  0])

    moves = split(readline(fname), ",")
    coords = [0,0,0]
    dist = 0
    for move in moves
        coords += dir2vec[move]
        dist = max(dist, div(sum(abs.(coords)), 2))
    end
    return dist
end

day11b()
