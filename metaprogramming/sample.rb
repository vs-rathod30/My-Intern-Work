class Account
    attr_accessor :name,:address,:email,:notes

    def assign_values(values)
        values.each_key do |k|
            self.send("#{k}=",values[k])
        end
    end

end

user_info={
    :name => "vijendra",
    :address => "MP",
    :email => "vsrathod30",
    :notes => "Annoying Customer"
}

account=Account.new
=begin
account.name = user_info[:name]
account.address= user_info[:address]
account.email=user_info[:email]
account.notes=user_info[:notes]
=end

account.assign_values(user_info)
puts account.inspect