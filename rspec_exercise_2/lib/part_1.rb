def partition(arr, n)
    smaller = []
    larger = []
    arr.each do |num|
        if num < n
            smaller << num
        else
            larger << num
        end
    end
    [smaller, larger]
end

def merge(hash1, hash2)
    res = {}
    hash1.each {|k,v| res[k] = v}
    hash2.each {|k,v| res[k] = v}
    res
end

def censor(str, arr)
    vowels = 'aeiou'
    res = str.split.map do |word|
        if arr.include?(word.downcase) 
            censor_word(word)
        else
            word
        end
    end
    res.join(' ')
end

def censor_word(word)
    vowels = 'aeiou'
    word.each_char.with_index {|ch, i| word[i] = '*' if vowels.include?(ch.downcase)}
    word
end

def power_of_two?(n)
    num = 0
    while num < n
        return true if 2 ** num == n
        return false if 2 ** num > n
        num += 1
    end
end