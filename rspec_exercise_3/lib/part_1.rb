def is_prime?(n)
    return false if n < 2
    (2...n).each {|i| return false if n % i == 0}
    true
end

def nth_prime(n)
    count = 0
    i = 2
    while count <= n
        count += 1 if is_prime?(i)
        return i if count == n
        i += 1
    end
end

def prime_range(min, max)
    res = (min..max).to_a
    res.select {|num| is_prime?(num)} 
end