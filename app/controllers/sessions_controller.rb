class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      # redirect_to root_path
    else
      render 'sessions/new'
    end
  end
  
end