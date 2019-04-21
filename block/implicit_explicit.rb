=begin
def calcution(a,b,&block)
    block.call(a,b)
end
puts calcution(5,7){|a,b| a+b}
=end


def calcution(a,b)
    yield(a,b)  # yield calls an implicit block
end

addtion=lambda{|x,y| x+y}
puts calcution(7,5,&addtion)   #like our upper example,
                            # &addition is an explicit(named) block
                            # --but 'yield' can still call it
 