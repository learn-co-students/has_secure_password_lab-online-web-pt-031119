class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: user_params[:name])
    if @user
    	return head(:forbidden) unless @user.authenticate(user_params[:password])
    	session[:user_id] = @user.id
    	render :"/users/welcome"
    else
    	redirect_to '/login'
    end
  end

  private

    def user_params
	   params.require(:user).permit(:name, :password, :password_confirmation)
	end

end