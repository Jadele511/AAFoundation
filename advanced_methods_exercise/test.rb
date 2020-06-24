def bubble_sort(array)
    sorted = false
    while sorted ==  false
        sorted = true

        (0...array.length - 1).each do |i|
            if array[i] > array[i + 1]
                array[i], array[i + 1] = array[i + 1], array[i]
                sorted = false
            end
        end
    end

    array
end

p bubble_sort([1,4,2,3])