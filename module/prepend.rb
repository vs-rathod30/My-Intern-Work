module ServiceDebugger
    def run(args)
        puts "Service run start :#{args.inspect}"
        result=super
        puts "Service run finished: #{result}"
    end
end

class Service
    prepend ServiceDebugger

    def run(args)
       # args.each{ |args|
        sleep 1
       # }
        "OK"
    end
end

user = Service.new
user.run(100)
puts
puts Service.ancestors
