include("ring-array.jl")

function day16b(steps = 316)
    state = RingArray([0])
    pos = 1
    len = 1
    cur_zero = 1
    cur_value = 1
    for ii in 1:50_000_000
        pos += steps
        pos = (pos - 1) % len + 1
        len += 1
        if pos < cur_zero || pos == len
            cur_zero += 1
        elseif pos == cur_zero
            cur_value = ii
        end
        pos += 1
    end
    return cur_value
end

day16b()
