function next_value(xx, fac, mult)
    val = (xx * fac) % 2147483647
    while val % mult != 0
        val = (val * fac) % 2147483647
    end
    return val
end

function day15b(a = 783, b = 325)
    tot = 0
    for _ in 1:5_000_000
        a = next_value(a, 16807, 4)
        b = next_value(b, 48271, 8)
        tot += (bits(a)[(end-15):end] == bits(b)[(end-15):end])
    end
    return tot
end

day15b()
