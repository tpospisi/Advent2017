include("dance.jl")

function day16a(fname = "input.txt")
    array = collect('a':'p')
    dance!(array, split(readline(fname), ","))
    return join(array)
end

day16a()
