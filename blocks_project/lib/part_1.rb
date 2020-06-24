def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject {|ele| ele['age'] <= 2}
end

def count_positive_subarrays(grid)
    grid.count {|sub_arr| sub_arr.sum > 0}
end

def aba_translate(word)
    vowels = "aeiou"
    res = ''
    word.each_char.with_index do |ch, i|
        if vowels.include?(ch)
            res +=  ch + 'b' + ch
        else
            res += ch
        end
    end
    res
end



def aba_array(arr)
    arr.map {|word| aba_translate(word)}
end