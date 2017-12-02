function day1a(fname = "input.txt")
    d = readline(fname)

    tot = 0
    n = length(d)
    for ii in 1:n
        if d[ii] == d[ii % n + 1]
            tot += parse(Int, d[ii])
        end
    end
    return tot
end

day1a()
