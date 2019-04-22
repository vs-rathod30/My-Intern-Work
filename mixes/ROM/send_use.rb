class Klass
    def hello(*args)
        "hello "+ args.join(' ')
    end
end

k=Klass.new
puts  k.send :hello, "vijendra","singh","rathod"

puts 1.send '+',2
puts 1.+(2)
puts send('+',1,2)