class Api::V1::UsersController < ApplicationController
	# skip_before_action :authentication_required, only: [:new, :create]

	def index 
		# @users = User.all
		# render json: @users, status: 200
	end

	def new 
		# @user = User.new
	end 


	def create 
	    # @user = User.new(user_params)
	    # if @user.save 
	    #   session[:user_id] = @user.id 
	    #   redirect_to @user
	    # else 
	    # 	render :new
	    # end
	    # render json: @user, status: 200
 	end  


	def show
		# @user = User.find(params[:id])
		# render json: @user, status: 200
		# @sent = current_user.sent_messages
		# @received = current_user.received_messages.sent
		#ASSIGN CONTACT_ID WHEN MSG SENT (maybe additional col - draft_id)
	end


	# def gifs_attributes=(gifs_attributes)
	# 	gifs_attributes.each do |gif_attributes| 
	# 		self.gifs.build(gif_attributes)
	# 	end
	# end


	def update
		# @user = User.find(params[:id])
		# @user.update(message_params)
		# render json: @user, status: 200
	end

	def destroy
		# @user = User.find(params[:id])
		# @user.delete
		# render json: {userId: @user.id}
	end



 	private

	def user_params
		# params.require(:user).permit(:username, :password_digest, :email)
	end

	
end
