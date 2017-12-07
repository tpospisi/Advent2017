function day7a(fname = "input.txt")
    nodes = Set()
    parents = Set()
    for line in readlines(fname)
        ss = split(line, [',', ' '], keep = false)
        push!(nodes, ss[1])
        if length(ss) > 2
            for xx in ss[4:end]
                push!(parents, xx)
            end
        end
    end
    return pop!(setdiff(nodes, parents))
end

day7a()
