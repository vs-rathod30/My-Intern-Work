module De
    def initialize(name)
        @name=name
    end
    def to_s
        @name
    end
    
end


module Debug
    include De
    def who_am_i?
        "#{self.class.name} {\##{self.object_id}}: #{self.to_s}"
    end
end

class Phonograph
    include Debug
end
class EightTrack
    include Debug
end
puts
ph=Phonograph.new("vijendra")
p ph.who_am_i?
puts
et=EightTrack.new("Rathod")
p et.who_am_i?