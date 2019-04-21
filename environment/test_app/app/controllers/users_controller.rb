class UsersController < ApplicationController

    def index
        @users = User.all 
        #me = User.new
    end

end
