class Api::V1::GifsController < ApplicationController
  # skip_before_action :authenticate, only: [:create]


	def index
		@gifs = current_user.gifs.order(:created_at)
		render json: {status: 'SUCCESS', message: "gifs loaded", data: @gifs}, status: :ok
	end

	def show 
		@gif = Gif.find(params[:id])
		render json: {status: 'SUCCESS', message: "gif loaded", data: @gif}, status: :ok
	end

	def create
		# HOW TO USE PRIVAT STONG PARAMS?
		gifs = params.require(:gifs)
		savedGifs = []
		gifs.each do |gif|

			# FIND OR CREATE BY
			@gif = Gif.new(gif.permit(:url))
			if @gif.save
				savedGifs.push(@gif)
				current_user.gifs.push(@gif)
			else
				render json: {status: 'ERROR', message: "unprocessable_entity", data: @gif.errors}, status: :unprocessable_entity
			end
		end
		# binding.pry
		render json: {status: 'SUCCESS', message: "gifs created", data: savedGifs}, status: :ok
	end

	def destroy
		@gif = Gif.find(params[:id])

		# DELETE ONLY FROM USER GIFS
		# if current_user.gifs.delete(@gif)
		if @gif.destroy
			render json: {status: 'SUCCESS', message: "gif deleted", data: @gif}, status: :ok
		else
			render json: {status: 'ERROR', message: "unprocessable_entity", data: @gif.errors}, status: :unprocessable_entity
		end
	end


	private

	# def set_gif
	# 	@gif = Gif.find_by(id: params[:id])
	# end


	def gif_params
		params.require(:gif).permit(:url)
	end


end
