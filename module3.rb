module Perimeter
    class Array
        def initialize
            @size=400
        end
        def size
            @size
        end
    end
end

our_array=Perimeter::Array.new
ruby_array=Array.new

p our_array.class
p our_array.size

p ruby_array.class
p ruby_array.size