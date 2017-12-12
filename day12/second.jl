function day12b(fname = "input.txt")
    adjlist = Dict{Int, Vector{Int}}()
    for line in readlines(fname)
        left, right = split(line, "<->")
        adjlist[parse(Int, left) + 1] = parse.(Int, split(right, ",")) + 1
    end

    n = length(adjlist)
    group_id = collect(1:n)
    for ii in 1:n, neighbor in adjlist[ii]
        min_val = min(group_id[neighbor], group_id[ii])
        max_val = max(group_id[neighbor], group_id[ii])
        group_id[group_id .== max_val] = min_val
    end
    return length(unique(group_id))
end

day12b()
