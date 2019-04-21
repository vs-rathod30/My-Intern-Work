module WarmUp 
     def push_ups
        "hey,I need a break"
     end
    end

    class Gym
        include WarmUp
        def pre
            "i am building my biceps"
        end
    end

    puts Gym.new.push_ups



    puts WarmUp.class
    puts Class.superclass
    puts Module.superclass