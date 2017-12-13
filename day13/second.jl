using Primes

function day13b(fname = "input.txt")
    depths = Int[]
    ranges = Int[]
    for line in readlines(fname)
        depth, range = parse.(Int, split(line, ":"))
        push!(depths, depth)
        push!(ranges, range)
    end
    periods = 2 * (ranges - 1)

    delay = 0
    while true
        tot_severity = 0
        !any((depths + delay) .% periods .== 0) && return delay
        delay += 1
    end
end

day13b()
