require 'rails/mongoid'

class PostsController < ApplicationController
    
    
    def index
        
        @user = User.find(params[:user_id])
        @post = @user.posts
    end

    def show
        @post = Post.find(params[:id])
    end
    
    def create
        post = Post.new(post_params)
         
        @user = User.find(params[:user_id])
        @user.posts << post
        @post = post
        if @post
            render 'show'
        else
            flash[:notice] = "Error"
            render 'new'
        end
    end

    def edit
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:id])
    end

    def new
        @post = Post.new

    end

    def update
        #byebug
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:id])

        if @post.update(post_params)
            render 'show'
        else
            render 'edit'
        end
    end
    
    def destroy
    end

    private
        def post_params
            params.require(:post).permit(:title, :text)
        end
        

end
