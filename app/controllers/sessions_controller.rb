class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      login
      redirect_to home_path
    else
      flash[:error] = "You entered the incorrect password."
      render 'new'
    end
  end
end
