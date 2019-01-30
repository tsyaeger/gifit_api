require 'auth'

module Api
	module V1
		class UsersController < ApplicationController
			skip_before_action :authenticate, only: [:create]

			def index 
				@users = User.all
				render json: @users, status: 200
			end

			def show
				@user = User.find(params[:id])
				render json: @user, status: 200
			end

			def create 
				binding.pry
			    @user = User.new(user_params)
			    if @user.save 
				    render json: @user, status: 200
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