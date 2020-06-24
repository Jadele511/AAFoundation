def my_map(arr, &prc)
    arr.each_index {|i| arr[i] = prc.call(arr[i])}
end


def my_select(arr, &prc)
    res = []
    arr.each {|ele| res << ele if prc.call(ele)}
    res
end



def my_count(arr,&prc)
    count = 0
    arr.each {|ele| count += 1 if prc.call(ele)}
    count
end


def my_any?(arr, &prc)
    arr.each do |ele|
        if prc.call(ele)
            return true
        end
    end
    false
end


def my_all?(arr, &prc)
    arr.each do |ele|
        if !prc.call(ele)
            return false
        end
    end
    true
end

def my_none?(arr, &prc)
    arr.each do |ele|
        if prc.call(ele)
            return false
        end
    end
    true
end