puts "Enter number of element in an array"
n=gets.chomp.to_i

arr=Array.new(n)
puts "Enter element in an array"
i=0
n.times{
    arr[i]=gets.chomp.to_i
    i+=1
}
$sum=0
arr.each{ |x| $sum+=x}

def sum_proc(arr,num)
    i,l,r=0,0,0
    s=lambda{|index,arr|
    if index==0
        r=$sum-arr[index]
    else
        r=$sum-arr[index]-l
    end
    l+=arr[index]
    return l-arr[index],r

}
   for i in 0...num do
   print s.call(i,arr)
   end
   puts

end
sum_proc(arr,n)

#arr.each{|x| print "#{x} "}