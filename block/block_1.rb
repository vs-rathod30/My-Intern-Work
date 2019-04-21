def operation_on_block(array)
    total=0
    refund=0

    index=0
    while index < array.length do
      total=  yield(total,array[index],1)
       refund= yield(refund,array[index],2)
        index+=1
    end
    puts total 
    puts refund
end
arr = [25,34,55,43,29,41]
puts operation_on_block(arr){|res,i,block|
   if block==1
     res=res+i
    elsif block==2
    res-=i
    end
 res
}


