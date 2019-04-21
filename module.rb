module Add
def addition(a,b)
    a+b
end
end

class Add_module
    include Add
    def initialize(a,b)
        @A,@B=a,b
        @c=addition(@A,@B)

    end
    def module_call
        puts @c
    end

end


a=Add_module.new(12,13)
puts a.module_call

