# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.


def largest_prime_factor(n)
    i = n
    while i > 0
        if n % i == 0 && prime?(i)
            return i
        end
        i -= 1
    end
end

def prime?(n)
    return false if n < 2
    (2...n).each do |factor|
        if n % factor == 0
            return false
        end
    end
    true
end




def unique_chars?(str)
    hash = Hash.new(0)
    str.each_char {|ch| hash[ch] += 1}
    hash.values.none? {|n| n > 1 }
end


def dupe_indices(arr)
    hash = Hash.new {|h,k| h[k] = []}
    arr.each_index {|i| hash[arr[i]] << i}
    hash.select! {|k,v| v.length >= 2}
end

def ana_array(arr1, arr2)
    return false if arr1.length != arr2.length
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    arr1.each {|ele| hash1[ele] += 1}
    arr2.each {|ele| hash2[ele] += 1}
    hash1.all? {|k,v| v == hash2[k]}
end