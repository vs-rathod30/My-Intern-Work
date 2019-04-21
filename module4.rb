module Dojo
    A=4
    module Kata
        B=8
        module Roulette
            class ScopeIn
                def push
                15
                 end
            end
        end
    end
end
A=16
B=32
C=60
puts "A - #{A}"
puts "Dojo::A - #{Dojo::A}"
puts
puts "B - #{B}"
puts "Dojo::Kata::B - #{Dojo::Kata::B}"
puts
puts " C- #{C}"
puts "Dojo::Kata::Roulette::ScopeIn.new.push - #{Dojo::Kata::Roulette::ScopeIn.new.push}"