def fib(num,flag=false)
  if num < 0 
    return 0
  end

   res=Array.new
   res[0]=1
   res[1]=1

   for i in 2...num
    res[i]=res[i-1]+res[i-2]
    i+=1
   end

   if flag then
   return res
   else
    return res[num-1]
   end

end

puts "Option\n1. only single number needed for that place\n2. full series need upto that place\n3.exit"
res=gets.chomp
if res.to_i < 3
puts "Enter place for fibonacci series number"
n=gets.chomp
end
result=case res.to_i
  when 1 then
     fib(n.to_i)
     
  when 2 then 
     fib(n.to_i,true)
     
  else 
    "Thank you! Dear:"
  end

  puts "result :->  #{result}"