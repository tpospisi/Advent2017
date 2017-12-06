function day6b(fname = "input.txt")
    banks = [parse(Int, xx) for xx in split(readline(fname))]
    n = length(banks)
    seen = Dict()
    steps = 0
    while !haskey(seen, banks)
        steps += 1
        seen[copy(banks)] = steps
        num, idx = findmax(banks)
        banks[idx] = 0
        for ii = 1:num
            banks[(idx + ii - 1) % n + 1] += 1
        end
    end
    return steps - seen[banks] + 1
end

day6b()
