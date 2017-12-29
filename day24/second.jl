include("common.jl")

function day24b(fname = "input.txt")
    components = []
    for line in readlines(fname)
        left, right = parse.(Int, split(line, "/"))
        push!(components, (left, right))
    end

    value = bridge -> (length(bridge), sum(sum(components[el]) for el in bridge))
    return maximum(value, complete_bridges(components))[2]
end

day24b()
