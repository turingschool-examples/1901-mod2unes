class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @errors = ['Your credentials are bad and you should feel bad']
      render :new
    end
  end
end