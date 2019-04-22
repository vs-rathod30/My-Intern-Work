class Parent
    def initialize
        puts "parent class"
    end
   
end

class Child<Parent
    def initialize
        super
        puts "child class"
    end
   #=begin
     def name 
        puts "child"
       end
    #=end
end

p=Parent.new
c=Child.new
p.name
c.name