module Api
	module V1
		class MessagesController < ApplicationController
			# before_action :set_gif, only: [:show, :update, :delete]

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
				if gif_ids = params[:gif_ids]
					add_gifs(gif_ids)
				end
				render json: @message, status: 200
			end

			def update
				@message = Message.find(params[:id])
				if gif_ids = params[:gif_ids]
					add_gifs(gif_ids)
				end
				@message.update(message_params)
				render json: @message, status: 200
			end

			def destroy
				@message = Message.find(params[:id])
				@message.delete
				render json: {messageId: @message.id}
			end

			# Does this belong in controller?
			def add_gifs(gif_id_array)
				gif_id_array.each do |id|
					gif = Gif.find_by(id: id)
					@message.gifs << gif 
					# binding.pry
				end
			end


			private

			def set_message
				@message = Message.find_by(id: params[:id])
			end

			def message_params
				params.require(:message).permit(:header, :footer, :sender_id, :receiver_id, :sent, :gif_ids => [])
			end
		end
	end
end