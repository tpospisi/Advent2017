function day9b(str = readline("input.txt"))
    tot = 0
    in_garbage = false
    ii = 0
    while ii < length(str)
        ii += 1
        if in_garbage
            if str[ii] == '>'
                in_garbage = false
            elseif str[ii] == '!'
                ii += 1
            else
                tot += 1
            end
        elseif str[ii] == '<'
            in_garbage = true
        end
    end
    return tot
end

day9b()
