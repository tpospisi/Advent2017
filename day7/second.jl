function day7b(fname = "input.txt")
    tower_weight = Dict{SubString{String}, Int}()
    weight = Dict{SubString{String}, Int}()
    done = Set{SubString{String}}()

    lines = readlines(fname)
    for line in lines
        ss = split(line)
        weight[ss[1]] = parse(Int, ss[2][2:end-1])
        if length(ss) == 2
            push!(done, ss[1])
            tower_weight[ss[1]] = weight[ss[1]]
        end
    end

    while true
        for line in lines
            ss = split(line, [',', ' '], keep = false)
            if !in(ss[1], done) && all(in.(ss[4:end], done))
                above_weights = [tower_weight[xx] for xx in ss[4:end]]
                if length(unique(above_weights)) != 1
                    if sum(above_weights .== maximum(above_weights)) == 1
                        idx = indmax(above_weights)
                        diff = minimum(above_weights) - maximum(above_weights)
                    else
                        idx = indmin(above_weights)
                        diff = maximum(above_weights) - minimum(above_weights)
                    end
                    return weight[ss[4:end][idx]] + diff
                end
                tower_weight[ss[1]] = weight[ss[1]] + sum(above_weights)
                push!(done, ss[1])
            end
        end
    end
end

day7b()
