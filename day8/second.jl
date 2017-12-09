using DataStructures

function day8b(fname = "input.txt")
    compare_dict = Dict("==" => ==, "!=" => !=,
                        "<" => <, ">" => >,
                        "<=" => <=, ">=" => >=)

    registers = DefaultDict{SubString{String}, Int}(0)
    max_val = 0
    for line in readlines(fname)
        register, command, value, _, target, compare, comparand = split(line)
        if compare_dict[compare](registers[target], parse(Int, comparand))
            registers[register] += parse(Int, value) * (command == "inc" ? 1 : -1)
        end
        max_val = max(max_val, registers[register])
    end
    return max(max_val, maximum(values(registers)))
end

day8b()
