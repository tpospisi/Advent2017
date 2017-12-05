function day5a(fname = "input.txt")
    offsets = [parse(Int, xx) for xx in readlines(fname)]

    cur = 1
    steps = 0
    while cur <= length(offsets)
        offsets[cur] += 1
        cur += offsets[cur] - 1
        steps += 1
    end
    return steps
end

day5a()
