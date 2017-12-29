using DataStructures

function complete_bridges(components)
    queue = Stack(Tuple{Int, Vector{Int}})
    push!(queue, (0, []))

    Channel(ctype=Vector{Int}, csize=1) do c
        while !isempty(queue)
            link, list = pop!(queue)
            complete = true
            for (ii, (l, r)) in enumerate(components)
                in(ii, list) && continue
                if l == link
                    push!(queue, (r, [list; ii]))
                    complete = false
                elseif r == link
                    push!(queue, (l, [list; ii]))
                    complete = false
                end
            end
            complete && put!(c, list)
        end
    end
end
