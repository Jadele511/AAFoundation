# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    # hash = {}
    # str.split('').each {|ch| hash[ch] += 1}

    res = ''
    streak = 1
    (1..str.length).each do |i|
        if str[i] == str[i-1]
            streak += 1
        else 
            if  streak > 1
                res += streak.to_s + str[i-1]
            else
                res += str[i-1]
            end
            streak = 1
        end
    end
    res

end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
