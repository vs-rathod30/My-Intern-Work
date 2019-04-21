class User < ApplicationRecord

    def howOld
        "i am" + self.age.to_s + "year's old"
    end


end