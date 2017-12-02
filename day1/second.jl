function day1b(fname = "input.txt")
    d = readline(fname)

    tot = 0
    n = length(d)
    for ii in 1:n
        if d[ii] == d[(ii + div(n, 2) - 1) % n + 1]
            tot += parse(Int, d[ii])
        end
    end

    return tot
end

day1b()
