include("knot_hash.jl")

function day14a(input = "uugsqrei")
    return sum(sum(knot_hash("$input-$ii") for ii = 0:127))
end

day14a()
