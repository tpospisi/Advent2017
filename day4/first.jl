function day4a(fname = "input.txt")
    lines = readlines(fname)

    tot = 0
    for line in lines
        tmp = split(line)
        if length(tmp) == length(unique(tmp))
            tot += 1
        end
    end
    return tot
end

day4a()
