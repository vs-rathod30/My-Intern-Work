class Add
    @@a
    @@b
    def initialize(a=0,b=0)
        @@a=a
        @@b=b
    end

    def addition
        puts @@a+@@b
    end
end

add=Add.new(12,28)
add.addition

ad=Add.new(10)
ad.addition
s=Add.new
s.addition