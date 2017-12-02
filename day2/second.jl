function day2b(fname = "input.txt")
    input = readlines(fname)

    tot = 0
    for line in input
        seq = [parse(Int, ii) for ii in split(line)]
        for top in seq, bot in seq
            if top > bot && top % bot == 0
                tot += div(top, bot)
                break
            end
        end
    end
    return tot
end

day2b()
