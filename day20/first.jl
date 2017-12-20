function day20a(fname = "input.txt")
    function helper(line)
        regex = r"p=<(.*),(.*),(.*)>, v=<(.*),(.*),(.*)>, a=<(.*),(.*),(.*)>"
        m = match(regex, line)
        px, py, pz, vx, vy, vz, ax, ay, az = parse.(Int, m.captures)
        return abs(ax) + abs(ay) + abs(az)
    end

    return indmin(map(helper, lines)) - 1
end

day20a()
