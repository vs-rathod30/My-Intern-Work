def greeting()
    puts "Hello!,"
    yield
end
greeting{puts " how are you"}
def test(&block)
    block.call
end

greeting
test(greeting)