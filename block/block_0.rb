def demostrate_block(num)
    yield num
end

puts demostrate_block(25){|num| num+1}
