fib = Hash.new{
        |hash,key| hash[key]= key<2?key:hash[key-1]+hash[key-2]
        
}
puts fib[20]
fib.each{|k,v| puts "#{k} ->#{v}"}