def call_proc
    puts "before proc"
    my_proc=Proc.new{return 2}
    my_proc.call
    
    puts "after proc"
end

p call_proc