class Ghost
    def self.reflect
        puts self==Ghost
       puts Ghost.class
       puts self.class
        self
    end
end

g=Ghost.new
puts Ghost.reflect==g
puts g.class