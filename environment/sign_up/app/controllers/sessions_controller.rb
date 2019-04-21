class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      redirect_to 'new'
    else
      flash[:notice] = 'Invalide email/password combination'
      render 'users/new'
    end
  end

  def destroy
  end

end
