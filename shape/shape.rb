
module Shapes
    class Circle
        PI=3.14
        def initialize(r)
            @radius=r
            puts "area = " +self.area.to_s
            puts "perimeter = " + self.perimeter.to_s
        end
        def area
            PI*@radius*@radius
        end
        def perimeter
            2*PI*@radius
        end
    end


    class Triagle
        def initialize(a1,a2,a3)
            @b,@h,@p=a1,a2,a3
            puts "area = " +self.area.to_s
            puts "perimeter = " + self.perimeter.to_s
        end
        def area
            (@b+@h)*1/2
        end
        def perimeter
            @b+@h+@p
        end
    end
    class Squre
        def initialize(s)
            @a=s
            puts "area = " +self.area.to_s
            puts "perimeter = " + self.perimeter.to_s
        end
        def area
            @a*@a
        end
        def perimeter
            4*@a
        end
    end


end

class Shape
    include Shapes
    def initialize()
        flag=false
        begin
            puts "1. Circle\n2. Triagle\n3. Squre\n\texit"
                ch=gets.chomp
                case ch.to_i
                when 1
                       puts "Enter redius for circle"
                       r=gets.chomp.to_i
                       Circle.new(r)
                       flag=false
                when 2
                       puts "Enter side lenght of Triangle"
                       s=Array.new(3)
                       for i in 0...3 do
                        s[i]=gets.chomp
                       end
                       Triagle.new(s[0].to_i,s[1].to_i,s[2].to_i)
                       flag=false
                    when 3
                        puts "Enter squre side"
                        a=gets.chomp
                        Squre.new(a.to_i)
                        flag=false
                else
                    puts "invalid choice"
                    flag=true
                end
            end  while flag==true

        end 
end

Shape.new
