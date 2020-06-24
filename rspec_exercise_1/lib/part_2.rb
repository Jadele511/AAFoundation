def hipsterfy(word)
    vowels = "aeiou"
    i = word.length - 1
    while i >= 0
        if vowels.include?(word[i])
            return word[0...i] + word[i+1..-1]
        end
        i -= 1
    end
    word
end

def vowel_counts(str)
    hash = Hash.new(0)
    vowels = 'aeiou'
    str.each_char {|ch| hash[ch.downcase] += 1 if vowels.include?(ch.downcase)}
    hash
end

def caesar_cipher(str, n)
    alpha = ("a".."z").to_a
    str.each_char.with_index do |ch, i|
        if alpha.include?(ch)
            new_idx = (alpha.index(ch) + n ) % alpha.length
            str[i] = alpha[new_idx]
        end
    end
    str
end
