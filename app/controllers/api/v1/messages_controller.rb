module Api
	module V1
		class MessagesController < ApplicationController
			before_action :set_message, only: [:show, :update, :destroy]

			def index
				@messages = current_user.sent_messages + current_user.received_messages
				# @messages = current_user.user_messages
				json_response(@messages)
			end

			def show 
				# restrict message to user and, if status is sent, the recipient
				if current_user.id == @message.sender_id || (current_user == @message.receiver_id && @message.sent)
					json_response(@message)
				else 
					empty_response
				end
			end

			def create
				@message = Message.create!(message_params.merge({ sender_id: current_user.id }))
				@message.gif_ids = message_params[:gif_ids]

				json_response(@message)
			end

			def update
				@message.update!(message_params)
				json_response(@message)
			end

			def destroy
				@message.destroy
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