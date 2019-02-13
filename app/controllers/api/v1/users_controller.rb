require 'auth'

module Api
	module V1
		class UsersController < ApplicationController
			skip_before_action :authenticate, only: [:create]

			def index 
				@users = User.all
				# render json: {status: 'SUCCESS', message: "users loaded", data: @users}, status: :ok
				render json: @users, status: 200
			end

			def show
				@user = User.find(params[:id])
				render json: @user, status: 200
			end

			def create 
				# binding.pry
			    @user = User.new(user_params)
			    if @user.save 
					jwt = Auth.issue({email: @user.email}, Time.now + 1.year)
	                render json: {
	                    username: @user.username,
	                    userID: @user.id,
	                    success: true,
	                    token: jwt
	                }, status: :created
	            else
					render json: {
					  success: false,
					  error: 'Invalid Credentials'
					}, status: :unauthorized
				end
		 	end  

			def destroy
				@user = User.find(params[:id])
				@user.delete
				render json: {userId: @user.id}
			end



		 	private

			def user_params
				params.require(:user).permit(:username, :password, :email)
			end

			
		end
	end
end