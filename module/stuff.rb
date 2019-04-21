module Stuff
    C=10
    def self.m(x)
        C*x
    end
    def p(x)
        C+x
    end
    class T
        def A
        @t=2
        end
    end
end

puts Stuff::C
puts Stuff::m(3)    #it's possible

#puts Stuff::p(3)    #it's not possible
x=Stuff::T.new
puts x.A
