def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(arr)
    arr.sum * 1.0 / arr.length 
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + '!'
end

def alternating_case(str)
    words = str.split
    words.each_index do |i|
        if i.even?
            words[i].upcase!
        else
            words[i].downcase!
        end
    end
    words.join(' ')
end