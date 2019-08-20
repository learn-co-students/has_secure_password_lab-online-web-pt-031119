class UsersController < ApplicationController
  
  def create
    @user = User.new
    if params[:user][:password]==params[:user][:password_confirmation]
      @user.name = params[:user][:name]
      @user.password = params[:user][:password]
      if @user.save
        session[:user_id] = @user.id
      else
        render 'users/new'
      end
    else
      redirect_to new_user_path
    end
  end

end