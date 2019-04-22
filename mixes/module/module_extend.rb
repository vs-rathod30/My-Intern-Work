module Foo
    def instance_method
        puts "instance method worked"
    end
end

class Bar
end

obj=Bar.new
obj.extend Foo
obj.instance_method