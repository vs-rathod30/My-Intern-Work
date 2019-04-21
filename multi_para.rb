def sample(*arg)
 i=arg.length
 for j in 0...i do
   puts "#{j+1} = #{arg[j]}"
   j+=1
 end
end

sample(10,9,8,7,6,5,4,3,2,1,0)
sample("a","b","c","d")
