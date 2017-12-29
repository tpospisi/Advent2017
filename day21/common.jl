mat2str = x -> join(mapslices(join, x, 1), "/")
str2mat = x -> hcat(collect.(split(x, "/"))...)

function transform(pattern)
    matrix = str2mat(pattern)

    n = size(matrix, 1)
    Channel(ctype=String, csize=1) do c
        # Identity
        put!(c, mat2str(matrix))

        # Flips
        put!(c, mat2str(matrix[:, n:-1:1]))
        put!(c, mat2str(matrix[n:-1:1, :]))

        # Rotation
        put!(c, mat2str(foldl(rotr90, matrix, 1)))
        put!(c, mat2str(foldl(rotr90, matrix, 2)))
        put!(c, mat2str(foldl(rotr90, matrix, 3)))

        # Flip then rotate
        put!(c, mat2str(foldl(rotr90, matrix[:, n:-1:1], 1)))
        put!(c, mat2str(foldl(rotr90, matrix[:, n:-1:1], 3)))
    end
end

function run_fractal(fname, n_iters)
    evolve = Dict{String, String}()
    for line in readlines(fname)
        lhs, rhs = split(line, " => ")
        for p in transform(lhs)
            evolve[p] = rhs
        end
    end

    pattern = ".#./..#/###"
    for _ in 1:n_iters
        mat = str2mat(pattern)
        nrow = size(mat, 2)
        dd = nrow % 2 == 0 ? 2 : 3
        new_pattern = fill('?', (dd + 1) * div(nrow, dd), (dd + 1) * div(nrow, dd))
        for ii = 1:div(nrow, dd), jj = 1:div(nrow, dd)
            left, right = dd * (ii - 1) + 1, dd * ii
            new_left, new_right = (dd + 1) * (ii - 1) + 1, (dd + 1) * ii
            bot, top = dd * (jj - 1) + 1, dd * jj
            new_bot, new_top = (dd + 1) * (jj - 1) + 1, (dd + 1) * jj

            block = evolve[mat2str(mat[left:right, bot:top])]
            new_pattern[new_left:new_right, new_bot:new_top] = str2mat(block)
        end
        pattern = mat2str(new_pattern)
    end

    return count(x == '#' for x in pattern)
end
