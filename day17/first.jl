include("ring-array.jl")

function day16a(steps = 316)
    state = RingArray([0])
    pos = 1
    for ii in 1:2017
        pos += steps
        pos = (pos - 1) % length(state.array) + 1
        insert!(state, ii, pos)
        pos += 1
    end
    return state[pos + 1]
end

day16a()
