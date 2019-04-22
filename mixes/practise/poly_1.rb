


class Human 
    def move
        puts 'Human move : X'
    end
end

class Computer 
    def move
        puts 'computer move : O'
    end
end

class Player
    def self.move(letter)
        if letter=='X'
        return Human.new
        else
            return Computer.new
        end
    end
end


p = Player.move('O')
p.move

