module Shape
   def Perimeter
    2*(@lenght+@breadth)
   end
end

class Rectangle
     include Shape
    def initialize(l,b)
        @lenght=l
        @breadth=b
    end
    

end
class Squre
     include Shape
    def initialize(s)
        @lenght=s
        @breadth=s
    end
end

puts Squre.new(5).Perimeter
puts Rectangle.new(12,15).Perimeter