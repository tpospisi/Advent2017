include("knot_hash.jl")

function day14b(input = "uugsqrei")
    used = falses(128, 128)
    for ii = 0:127
        used[ii + 1, :] = knot_hash("$input-$ii")
    end

    group_id = zeros(Int, 128, 128)
    id = 1
    for ii = 1:128, jj = 1:128
        if used[ii, jj]
            group_id[ii, jj] = id
        end
        id += 1
    end

    for x = 1:128, y = 1:128, (xoff, yoff) = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        if (1 <= x + xoff <= 128) && (1 <= y + yoff <= 128)
            maxval = max(group_id[x + xoff, y + yoff], group_id[x, y])
            minval = min(group_id[x + xoff, y + yoff], group_id[x, y])
            if minval > 0
                group_id[group_id .== maxval] = minval
            end
        end
    end

    return length(unique(group_id)) - 1
end

day14b()
