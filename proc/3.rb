def counter
    n=0
    return Proc.new{ n+=1 }
end

a=counter
5.times{puts a.call}

b=counter
3.times{  puts b.call}