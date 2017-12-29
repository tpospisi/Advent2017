using Primes

function day23b()
    b = 107900
    c = 124900
    skip = 17
    return count(!isprime(ii) for ii = b:skip:c)
end

day23b()
