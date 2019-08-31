require 'pry'

class UsersController < ApplicationController

	def new
	end


	def create
	   if (user_params[:password] != nil && user_params[:password] != "") || (user_params[:password] != nil && user_params[:password_confirmation] !=nil && user_params[:password] == user_params[:password_confirmation])
		   	@user = User.create(user_params)
			session[:user_id] = @user.id
			redirect_to '/welcome'

	 l  else
	    	redirect_to '/users'
	   end
	end

	# def create     
	# 	@user = User.create(user_params) 
	# 	binding.pry
	# 	return redirect_to controller: 'users', action: 'new' unless @user.save     
	# 		session[:user_id] = @user.id     
	# 		redirect_to '/welcome' 
	# end 

	def welcome
		@user = User.find_by(id: session[:user_id])
	end
	 
	private
	 
    def user_params
	   params.require(:user).permit(:name, :password, :password_confirmation)
	end


end