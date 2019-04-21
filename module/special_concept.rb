module Printable
    def self.class_method_x
        p 'class method'
    end
    def instance_method_y
        p 'instance method'
    end
end

class ExtendDocument
    extend Printable
end

class IncludeDocument
    include Printable
end

                ### access module method directly
 Printable.class_method_x
 ##  Printable.instance_method_y 

                ### access module method by Extend
##  ExtendDocument.class_method_x
ExtendDocument.instance_method_y
##  ExtendDocument.new.class_method_x
##  ExtendDocument.new.instance_method_y


                ### access module method by Inlcude
##  IncludeDocument.class_method_x
##  IncludeDocument.instance_method_y
##  IncludeDocument.new.class_method_x
IncludeDocument.new.instance_method_y


puts
puts IncludeDocument.ancestors