fp=File.new("sample.txt","w+")

if fp
    name = gets.chomp
    fp.syswrite(name)
else
    puts "Unable to open file"
end

fp.close