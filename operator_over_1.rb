class Box
    def initialize(w,h)
        @wid,@hei=w,h
    end

    def +(other)
        Box.new(@wid+other.@wid,@hei+other.@hei)
    end

    def -@
        Box.new(-@wid,-@hei)
    end

    def *(scalar)
        Box.new(@wid*scalar.@wid,@hei*scalar.@hei)
    end
end

b=Box.new(15,12)
b1=Box.new(12,14)

puts b+b1
#puts b-b1
puts b*b1