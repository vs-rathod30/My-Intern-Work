def filter(array)
    for i in 0...array.length do
    yield(array[i])
    end
end

result=lambda{|val|
        if val > b
        b=val      
      end
    
    }

    arr=[4,2,-4,-3,5]
    puts filter(arr)