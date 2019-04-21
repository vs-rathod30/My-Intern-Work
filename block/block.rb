class Noval
    attr_accessor :pages, :category

    def initialize
        #yield(self)
    end
end

noval=Noval.new #do |n| 
    noval.pages=564 
    noval.category="thriller"
#end

noval.pages =1000
puts "I am reading a #{noval.category} novel which has  #{noval.pages} pages"