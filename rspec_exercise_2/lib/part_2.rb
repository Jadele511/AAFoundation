def palindrome?(str)
    (0..str.length/2).each do |i|
        return false if str[i] != str[str.length - 1 - i]
    end
    true
end

def substrings(str)
    res = []
    (0...str.length).each do |i|
        (i...str.length).each do |j|
            res << str[i..j]
        end
    end
    res
end

def palindrome_substrings(str)
    res = []
    substrings(str).each {|sub| res << sub if palindrome?(sub) && sub.length > 1}
    res
end