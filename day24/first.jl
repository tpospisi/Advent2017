include("common.jl")

function day24a(fname = "input.txt")
    components = []
    for line in readlines(fname)
        left, right = parse.(Int, split(line, "/"))
        push!(components, (left, right))
    end

    strength = bridge -> sum(sum(components[el]) for el in bridge)
    return maximum(strength, complete_bridges(components))
end

day24a()
