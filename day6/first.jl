function day6a(fname = "input.txt")
    banks = [parse(Int, xx) for xx in split(readline(fname))]

    n = length(banks)
    seen = Set{Vector{Int}}()
    steps = 0
    while !in(banks, seen)
        steps += 1
        push!(seen, copy(banks))
        num, idx = findmax(banks)
        banks[idx] = 0
        for ii in 1:num
            banks[(idx + ii - 1) % n + 1] += 1
        end
    end
    return steps
end

day6a()
