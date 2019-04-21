=begin
begin
    file=open("test.txt")
    if file
        puts "file opened successfully"
    end
rescue
    file=STDIN
end
print file, "==",STDIN,"\n"
=end

fp="test.txt"
begin
    file = open(fp)
    if file
        puts "file opened successfully"
    end
    rescue
        #raise      #if you want to raise the error for user
        puts "file is not exists\n\n"
        puts "enter existing file name"
        fp=gets.chomp
        retry
    end