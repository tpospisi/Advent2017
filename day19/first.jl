using DataStructures
function day19a(fname = "input.txt")
    lines = DefaultDict{Tuple{Int, Int}, Char}(' ')
    for (ii, line) in enumerate(readlines(fname)), (jj, char) in enumerate(line)
        lines[jj, ii] = char
    end

    x = find([c for c in readline(fname)] .== '|')[1]
    y = 1

    path = ""
    Δx, Δy = 0, 1
    while true
        x += Δx
        y += Δy

        cur = lines[x, y]
        if cur == ' '
            return path
        elseif cur == '+'
            if Δy == 0 && lines[x + Δx, y + Δy] != '-'
                Δy = lines[x, y + 1] != ' ' ? 1 : -1
                Δx = 0
            elseif Δx == 0 && lines[x + Δx, y + Δy] != '|'
                Δx = lines[x + 1, y] != ' ' ? 1 : -1
                Δy = 0
            end
        elseif cur != '-' && cur != '|'
            path = "$path$cur"
        end
    end
end
