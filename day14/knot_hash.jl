type RingArray{G <: Number}
    array::Vector{G}
end

import Base.getindex
function getindex(v::RingArray, i)
    return v.array[(i - 1) .% length(v.array) + 1]
end
import Base.setindex!
function setindex!(v::RingArray, val, i)
    return v.array[(i - 1) .% length(v.array) + 1] = val
end

function knot_hash(key)
    lengths = Vector{UInt8}(key)
    append!(lengths, [17, 31, 73, 47, 23])
    list = RingArray(collect(0:255))
    cur = 1
    skip = 0
    for round in 1:64, len in lengths
        list[cur:(cur + len - 1)] = reverse(list[cur:(cur + len - 1)])
        cur += len + skip
        skip += 1
    end
    dense = [[c == '1' for c in bits(UInt8(reduce(xor, list[(16 * ii + 1):(16 * (ii + 1))])))] for ii in 0:15]
    return vcat(dense...)
end
