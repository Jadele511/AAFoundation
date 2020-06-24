def proper_factors(n)
    res = []
    (1...n).each {|i| res << i if n % i == 0 }
    res 
end

def aliquot_sum(n)
    proper_factors(n).sum
end

def perfect_number?(n)
    aliquot_sum(n) == n ? true : false
end

def ideal_numbers(n)
    res = []
    i = 1
    while res.length <= n
        res << i if perfect_number?(i)
        i += 1
    end
    res
end