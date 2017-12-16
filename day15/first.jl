function next_value(xx, fac)
    return (xx * fac) % 2147483647
end

function day15a(a = 783, b = 325)
    tot = 0
    for num in 1:40_000_000
        a = next_value(a, 16807)
        b = next_value(b, 48271)
        tot += (bits(a)[(end-15):end] == bits(b)[(end-15):end])
    end
    return tot
end

day15a()
