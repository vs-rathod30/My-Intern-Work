class Array_sum
    attr_accessor :arr,:sum,:n
    def initialize(a,n)
        @sum=0
        @arr=a
        @n=n
    end
    def total
        arr.each{ |x| @sum+=x}
    end

    def sum_proc
        l,r=0,0
        sum=lambda{|index|
        if index==0
            r=@sum-@arr[index]
        else
            r=@sum-@arr[index]-l
        end
        l+=arr[index]
        return l-arr[index],r
    
    }
       for i in 0...@n do
       print sum.call(i)
       end
       puts
    end
end

puts "Enter number of element in an array"
n=gets.chomp.to_i

arr=Array.new(n)
puts "Enter element in an array"
i=0
n.times{
    arr[i]=gets.chomp.to_i
    i+=1
}

obj=Array_sum.new(arr,n)
obj.total
obj.sum_proc