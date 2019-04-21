require_relative 'stuff.rb'
puts
class D
    extend Stuff
  #  puts self==D
    puts Stuff.m(4)   #using self keyword

end

d=D.new
puts D.p(5)   #it's possible using extend
# puts D.m(4)  it's not possible using extend

#D.new.p(5)    and   D.new.m(5)    both are impossible using extend


x=Stuff::T.new
