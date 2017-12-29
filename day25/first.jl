using DataStructures

function day25a(fname = "input.txt")
    write_val = Dict{Tuple{String, Int}, Int}()
    update_direction = Dict{Tuple{String, Int}, Int}()
    next_state = Dict{Tuple{String, Int}, String}()

    lines = readstring("input.txt")

    reg = Regex("In state (.):\n  If the current value is (0|1):\n    - Write the value (0|1).\n    - Move one slot to the (left|right).\n    - Continue with state (.).\n  If the current value is (0|1):\n    - Write the value (0|1).\n    - Move one slot to the (left|right).\n    - Continue with state (.).")

    for m in eachmatch(reg, lines)
        state = m[1]
        for offset in [2, 6]
            value = parse(Int, m[offset])
            write_val[state, value] = parse(Int, m[offset + 1])
            update_direction[state, value] = m[offset + 2] == "right" ? 1 : -1
            next_state[state, value] = String(m[offset + 3])
        end
    end

    state = String(match(r"Begin in state (.)", lines)[1])
    n_steps = parse(Int, match(r"after (\d*) steps", lines)[1])

    tape = DefaultDict{Int, Int}(0)
    cursor = 0
    for _ in 1:n_steps
        value = tape[cursor]
        tape[cursor] = write_val[state, value]
        cursor += update_direction[state, value]
        state = next_state[state, value]
    end

    return sum(values(tape))
end
