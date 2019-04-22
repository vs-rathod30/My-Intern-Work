def multiple_procs(p1,p2)
p1.call
p2.call
end

a= Proc.new{ puts "first proc"}
b=Proc.new{puts "sxecond proc"}

multiple_procs(a,b)