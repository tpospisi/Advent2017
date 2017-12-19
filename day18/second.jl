using DataStructures

type Machine
    pid::Int
    incoming::Channel
    outgoing::Channel
    lines::Vector{String}
    idx::Int
    registers::DefaultDict{String, Int}
    n_sent::Int
    Machine(pid::Int, incoming::Channel{Int}, outgoing::Channel{Int}, fname) = begin
        r = DefaultDict{String, Int}(0)
        r["p"] = pid
        new(pid, incoming, outgoing, readlines(fname), 1, r, 0)
    end
end

import Base.getindex
function getindex(m::Machine, str)
    return try parse(Int, str) catch m.registers[str] end
end
import Base.setindex!
function setindex!(m::Machine, val, str)
    m.registers[str] = val
end

function operate(m::Machine)
    !(1 <= m.idx <= length(m.lines)) && error("Out of Bounds")
    regex = match(r"([^\s]*) ([^\s]*) ?([^\s]*)?", m.lines[m.idx])
    op, addr, val = regex.captures
    if op == "set"
        m.registers[addr] = m[val]
    elseif op == "add"
        m.registers[addr] += m[val]
    elseif op == "mul"
        m.registers[addr] *= m[val]
    elseif op == "mod"
        m.registers[addr] %= m[val]
    elseif op == "jgz" && m[addr] > 0
        m.idx += m[val] - 1
    elseif op == "rcv"
        !isready(m.incoming) && return false
        m.registers[addr] = take!(m.incoming)
    elseif op == "snd"
        m.n_sent += 1
        put!(m.outgoing, m[addr])
    end
    m.idx += 1
    return true
end

function day18b(fname = "input.txt")
    fname = "input.txt"
    queue0 = Channel{Int}(Inf)
    queue1 = Channel{Int}(Inf)

    lines = readlines(fname)

    m0 = Machine(0, queue1, queue0, fname)
    m1 = Machine(1, queue0, queue1, fname)

    while operate(m0) || operate(m1)
    end

    return m1.n_sent
end

day18b()
