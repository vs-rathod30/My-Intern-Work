a,b=0,1
def fib(num,&b)
    i=2
    while i <=num do
       b.call # yield a,b
        i+=1
    end
    b
end
puts "enter number"
num=gets.chomp.to_i
fib(num)
puts lambda{
    |a,b| 
    a,b=b,a+b
}