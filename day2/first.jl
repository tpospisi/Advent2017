function day2a(fname = "input.txt")
    input = readlines(fname)

    tot = 0
    for line in input
        seq = [parse(Int, ii) for ii in split(line)]
        tot += maximum(seq) - minimum(seq)
    end
    return tot
end

day2a()
