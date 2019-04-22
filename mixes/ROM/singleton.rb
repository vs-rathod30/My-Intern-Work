class ABC
    def A
        puts 'a'
    end
    def B
        puts 'b'
    end
end

obj=ABC.new
def obj.C
    puts 'c'
end

obj.A
obj.B
obj.C

puts single=class << obj
    self
end
puts single.method_defined? :C


class << obj
    def D
        puts 'd'
    end
end
obj.D
puts ABC.method_defined? :D
puts single.method_defined? :D
puts obj.singleton_methods