class Api::V1::MessagesController < ApplicationController

	def index
		@messages = Message.all
		render json: @messages, status: 200
	end

	def show 
		@message = Message.find(params[:id])
		render json: @message, status: 200
	end

	def create
		@message = Message.create(message_params)
		render json: @message, status: 200
	end

	def update
		@message = Message.find(params[:id])
		@message.update(message_params)
		render json: @message, status: 200
	end

	def destroy
		@message = Message.find(params[:id])
		@message.delete
		render json: {messageId: @message.id}
	end


	private

	def message_params
		params.require(:message).permit(:header, :footer, :sender_id, :receiver_id, :sent)
	end

end
