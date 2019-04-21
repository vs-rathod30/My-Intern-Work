class UsersController < ApplicationController
    
    def home
    end

    def index
        @user = User.all
    end
    

    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)

        if @user.save
            flash[:success] = "Hello! #{@user.name}!,  Welcome to the App!"
            redirect_to @user
        else
            render 'new'
        end
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
    end
    
    def destroy
    end

   

    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end
