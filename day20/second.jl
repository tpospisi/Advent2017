function update!(p, v, a)
    v .+= a
    p .+= v
end

function day20b(fname = "input.txt")
    ps, vs, as = Vector{Int}[], Vector{Int}[], Vector{Int}[]
    for line in readlines(fname)
        regex = r"p=<(.*),(.*),(.*)>, v=<(.*),(.*),(.*)>, a=<(.*),(.*),(.*)>"
        m = match(regex, line)
        px, py, pz, vx, vy, vz, ax, ay, az = parse.(Int, m.captures)

        push!(ps, [px, py, pz])
        push!(vs, [vx, vy, vz])
        push!(as, [ax, ay, az])
    end

    n = length(ps)
    alive = trues(n)
    enough_iters = 1000
    for _ = 1:enough_iters
        no_dups = Dict{Tuple{Int, Int, Int}, Int}()
        for ii = 1:n
            if alive[ii]
                update!(ps[ii], vs[ii], as[ii])
                if haskey(no_dups, Tuple(ps[ii]))
                    alive[ii] = false
                    alive[no_dups[Tuple(ps[ii])]] = false
                else
                    no_dups[Tuple(ps[ii])] = ii
                end
            end
        end
    end
    return count(alive)
end

day20b()
