class UsersController < ApplicationController

	def new
	end


	def create
	   @user = User.create(user_params)
	   binding.pry
       session[:user_id] = @user.id
       redirect_to '/welcome'
	end

	def welcome
		@user = User.find_by(id: session[:user_id])
	end
	 
	private
	 
    def user_params
	   params.require(:user).permit(:name, :password, :password_confirmation)
	end


end