function day9a(str = readline("input.txt"))
    tot = 0
    depth = 0
    ii = 0
    in_garbage = false
    while ii < length(str)
        ii += 1
        if in_garbage
            if str[ii] == '>'
                in_garbage = false
            elseif str[ii] == '!'
                ii += 1
            end
        else
            if str[ii] == '<'
                in_garbage = true
            elseif str[ii] == '{'
                depth += 1
            elseif str[ii] == '}'
                tot += depth
                depth -= 1
            end
        end
    end
    return tot
end

day9a()
