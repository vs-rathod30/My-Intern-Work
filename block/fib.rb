
def fibonacci(num,total)
    if num <= 2
        return 1
    end
        total=yield fibonacci(num-1)
        total+=yield fibonacci(num-2)
        total
    
end
puts "Enter Number"
num=gets.chomp.to_i
total=0
puts fibonacci(num){|a,|
      res= a+b
      puts res
      res
}