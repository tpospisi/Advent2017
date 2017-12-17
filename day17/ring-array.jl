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

import Base.insert!
function insert!(v::RingArray, val, idx)
    insert!(v.array, rem(idx, length(v.array) + 1, RoundDown) + 1, val)
end
