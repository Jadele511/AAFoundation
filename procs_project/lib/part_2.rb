def reverser(str, &prc)
    # str.each_char.with_index {|ch, i| str[i] = prc.call(ch)}
    prc.call(str.reverse)
end

def word_changer(str, &prc)
   res = str.split.map {|ele| prc.call(ele)}
   res.join(' ')
end

def greater_proc_value(n, prc1, prc2)
    prc1.call(n) > prc2.call(n) ? prc1.call(n) :  prc2.call(n)
end

def and_selector(arr, prc1, prc2)
    arr.select {|el| prc1.call(el) && prc2.call(el)}
end

def alternating_mapper(arr, prc1, prc2)
    arr.map.with_index do|el, i| 
        if i.even?
            prc1.call(arr[i])
        else
            prc2.call(arr[i])
        end
    end

end