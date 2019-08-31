require 'pry'

class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
	   if (user_params[:password] != nil && user_params[:password_confirmation] !=nil) && user_params[:password] == user_params[:password_confirmation]
	   		@user = User.create(user_params)
			session[:user_id] = @user.id
			redirect_to '/welcome'
	   else
	    	redirect_to '/users'
	   end
	end

	def welcome
		@user = User.find_by(id: session[:user_id])
	end
	 
	private
	 
    def user_params
	   params.require(:user).permit(:name, :password, :password_confirmation)
	end


end