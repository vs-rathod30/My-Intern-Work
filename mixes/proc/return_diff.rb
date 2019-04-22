def lambda_test
    l=lambda{ return}
    l.call
    puts "hello lambda"
end

def proc_test
    p=Proc.new{ return }
    p.call
    puts "hello proc"
end

lambda_test
proc_test