# def zip(*arr)
#     res = []
#     (0...arr[0].length).each do |i|
#         subArr = []
#         (0...arr.length).each do |j|
#             subArr << arr[j][i]
#         end
#         res << subArr
#     end
#     res 
# end

def zip(*arr)
    (0...arr[0].length).map do |i|
        arr.map {|arr| arr[i]}
    end
end


def prizz_proc(arr, prc1, prc2)
    arr.select {|ele| (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele))}
end



def zany_zip(*arr)
    longest = arr[0].length
    arr.each do |subArr|
        longest = subArr.length if subArr.length > longest
    end
    longest

    (0...longest).map do |i|
        arr.map do |subArr|
            subArr[i]
        end
    end
end


def maximum(arr, &prc)
    return nil if arr.empty?
    max = arr.first
    arr.each do |el|
        max = el if prc.call(el) >= prc.call(max)
    end
    max
end


def my_group_by(arr, &prc)
    hash = Hash.new {|h,k| h[k] = []}
    arr.each do |ele|
        hash[prc.call(ele)] << ele 
    end
    hash
end

def max_tie_breaker(arr, tie_breaker, &prc)
    return nil if arr.empty?
    max = arr.first
    arr.each do |el|
        if prc.call(el) > prc.call(max)
            max = el 
        elsif prc.call(el) == prc.call(max) && (tie_breaker.call(el) > tie_breaker.call(max))
            max = el
        end
    end
    max
end


def silly_syllables(sentence)
    vowels = 'aeiou'
    words = sentence.split(' ')
    new_words = words.map do |word|
        num_vowels = word.split('').count {|ch| vowels.include?(ch)}
        if num_vowels < 2
            word
        else   
            remove_last_vowels(remove_first_vowels(word))
        end
    end
    new_words.join(' ')
end

def remove_first_vowels(word)
    vowels = 'aeiou'
    i = 0 
    while i < word.length
        return word[i..-1] if vowels.include?(word[i])
        i += 1
    end
end

def remove_last_vowels(word)
    vowels = 'aeiou'
    i = word.length - 1
    while i >= 0
        return word[0..i] if vowels.include?(word[i])
        i -= 1
    end
end