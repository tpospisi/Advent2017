function day13a(fname = "input.txt")
    tot_severity = 0
    for line in readlines(fname)
        depth, range = parse.(Int, split(line, ":"))
        if depth % ((range - 1) * 2) == 0
            tot_severity += depth * range
        end
    end
    return tot_severity
end

day13a()
