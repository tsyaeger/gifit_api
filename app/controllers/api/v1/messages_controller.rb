module Api
	module V1
		class MessagesController < ApplicationController
			before_action :set_message, only: [:show, :update, :destroy]

			def index
				@messages = Message.all
				# @messages = current_user.messages
				json_response(@messages)
			end

			def show 
				# binding.pry
				json_response(@message)
			end

			def create
				@message = Message.create!(message_params.merge({ sender_id: current_user.id }))
				@message.gif_ids = message_params[:gif_ids]

				json_response(@message)
			end

			def update
				@message.update!(message_params)
				@message.gif_ids = message_params[:gif_ids]

				json_response(@message)
			end

			def destroy
				@message.destroy
				# binding.pry
				empty_response
			end

			private

			def set_message
				@message = Message.find(params[:id])
			end

			def message_params
				params.require(:message).permit(:header, :footer, :sender_id, :receiver_id, :sent, :gif_ids => [])
			end
		end
	end
end