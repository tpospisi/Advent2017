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

function day10a(fname = "input.txt")
    lengths = parse.(Int, split(readline(fname), ","))
    list = RingArray(collect(0:255))
    cur = 1
    skip = 0
    for len in lengths
        list[cur:(cur + len - 1)] = reverse(list[cur:(cur + len - 1)])
        cur += len + skip
        skip += 1
    end
    return list[1] * list[2]
end

day10a()
