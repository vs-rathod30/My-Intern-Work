class D
    def one
        'hello'
    end
    def D.two
        'Vijendra'
    end
end

puts D.two
puts D.new.one

puts D.new.class
puts D.new.class.instance_methods.grep(/one/)
puts D.class
puts D.class.instance_methods.grep(/two/)