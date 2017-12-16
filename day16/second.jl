include("dance.jl")

function day16b(fname = "input.txt")
    arr = collect('a':'p')
    instructions = split(readline(fname), ",")

    seen = Dict()
    max_iter = 1_000_000_000
    ii = 1
    while ii < max_iter && !haskey(seen, join(arr))
        seen[join(arr)] = ii
        ii += 1
        dance!(arr, instructions)
    end
    for ii in 1:(max_iter % (ii - seen[join(arr)]))
        dance!(arr, instructions)
    end
    return join(arr)
end

day16b()
