type RingArray{G <: Number}
    array::Vector{G}
end

import Base.getindex
function getindex(v::RingArray, i)
    return v.array[(i - 1) % length(v.array) + 1]
end
import Base.setindex!
function setindex!(v::RingArray, val, i)
    return v.array[(i - 1) % length(v.array) + 1] = val
end

function day10b(fname = "input.txt")
    lengths = Vector{UInt8}(readline(fname))
    append!(lengths, [17, 31, 73, 47, 23])
    list = RingArray(collect(0:255))
    cur = 1
    skip = 0
    for round in 1:64
        for len in lengths
            list[cur:(cur + len - 1)] = reverse(list[cur:(cur + len - 1)])
            cur += len + skip
            skip += 1
        end
    end
    dense = [reduce(xor, list[(16 * ii + 1):(16 * (ii + 1))]) for ii in 0:15]
    return join(hex.(dense, 2))
end

day10b()
