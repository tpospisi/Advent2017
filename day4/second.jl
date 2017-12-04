function day4b(fname = "input.txt")
    lines = readlines(fname)

    tot = 0
    for line in lines
        tmp = [join(sort(collect(ww))) for ww in split(line)]
        if length(tmp) == length(unique(tmp))
            tot += 1
        end
    end
    return tot
end

day4b()
