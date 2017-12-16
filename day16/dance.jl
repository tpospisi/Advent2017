function dance!(programs, instructions)
    for instruction in instructions
        if instruction[1] == 's'
            programs[:] = circshift(programs, parse(Int, instruction[2:end]))
        elseif instruction[1] == 'x'
            idx_a, idx_b = parse.(Int, split(instruction[2:end], "/")) .+ 1
            programs[[idx_a, idx_b]] = programs[[idx_b, idx_a]]
        elseif instruction[1] == 'p'
            idx_a = find(programs .== instruction[2])[1]
            idx_b = find(programs .== instruction[4])[1]
            programs[[idx_a, idx_b]] = programs[[idx_b, idx_a]]
        end
    end
end
