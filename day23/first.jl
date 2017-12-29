using DataStructures

function day23a(fname = "input.txt")
    registers = DefaultDict{String, Int}(0)

    get_value = str -> try parse(Int, str) catch registers[str] end

    lines = readlines(fname)
    idx = 1
    tot = 0
    while 1 <= idx <= length(lines)
        m = match(r"([^\s]*) ([^\s]*) ?([^\s]*)?", lines[idx])
        op, addr, val = m.captures
        if op == "set"
            registers[addr] = get_value(val)
        elseif op == "sub"
            registers[addr] -= get_value(val)
        elseif op == "mul"
            registers[addr] *= get_value(val)
            tot += 1
        elseif op == "jnz" && get_value(addr) != 0
            idx += get_value(val) - 1
        end
        idx += 1
    end
    return tot
end

day23a()
