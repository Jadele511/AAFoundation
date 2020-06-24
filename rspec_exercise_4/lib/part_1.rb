def  my_reject(arr, &prc)
    arr.select {|ele| !prc.call(ele)}
end

def my_one?(arr, &prc)
    1 == arr.each.count {|ele| prc.call(ele)}
end

def hash_select(hash, &prc)
    hash.reject {|k,v| !prc.call(k,v)}
end

def xor_select(arr, prc1, prc2)
    arr.select {|ele| (!prc1.call(ele) && prc2.call(ele)) || (prc1.call(ele) && !prc2.call(ele))}
end

def proc_count(val, prcs)
    prcs.each.count {|prc| prc.call(val)}
end

