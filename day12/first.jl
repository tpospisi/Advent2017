function day12a(fname = "input.txt")
    adjlist = Dict{Int, Vector{Int}}()
    for line in readlines(fname)
        left, right = split(line, "<->")
        adjlist[parse(Int, left) + 1] = parse.(Int, split(right, ",")) + 1
    end

    to_visit = Set(1)
    visited = Set()
    while !isempty(to_visit)
        cur = pop!(to_visit)
        push!(visited, cur)
        for neighbor in adjlist[cur]
            !in(neighbor, visited) && push!(to_visit, neighbor)
        end
    end
    return length(visited)
end

day12a()
