function day5b(fname = "input.txt")
    offsets = [parse(Int, xx) for xx in readlines(fname)]

    cur = 1
    steps = 0
    while cur <= length(offsets)
        adj = offsets[cur] >= 3 ? -1 : 1
        offsets[cur] += adj
        cur += offsets[cur] - adj
        steps += 1
    end
    return steps
end

day5b()
