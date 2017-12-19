using DataStructures

function day18a(fname = "input.txt")
    registers = DefaultDict{String, Int}(0)

    get_value = str -> try parse(Int, str) catch registers[str] end

    lines = readlines(fname)
    last_sound  = 0
    idx = 1
    while 1 <= idx <= length(lines)
        m = match(r"([^\s]*) ([^\s]*) ?([^\s]*)?", lines[idx])
        op, addr, val = m.captures
        if op == "set"
            registers[addr] = get_value(val)
        elseif op == "add"
            registers[addr] += get_value(val)
        elseif op == "mul"
            registers[addr] *= get_value(val)
        elseif op == "mod"
            registers[addr] %= get_value(val)
        elseif op == "jgz" && get_value(addr) > 0
            idx += get_value(val) - 1
        elseif op == "rcv" && get_value(addr) != 0
            return last_sound
        elseif op == "snd"
            last_sound = get_value(addr)
        end
        idx += 1
    end
end

day18a()
