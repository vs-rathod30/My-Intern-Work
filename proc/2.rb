p=Proc.new{puts "hello proc"}
l=lambda{puts "hello lambda"}

p.call
l.call

puts p
puts l