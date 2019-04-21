class Greeting
    def initialize(n="dear")
        @name=n
    end

    def sayHello
        puts "hello!, #{@name}"
    end

    def sayBye
        puts "hello!, Ba-Bye #{@name}"
    end
end

G=Greeting.new
G.sayHello
G.sayBye
g=Greeting.new("vijendra")
g.sayHello
g.sayBye