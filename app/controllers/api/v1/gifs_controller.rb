class Api::V1::GifsController < ApplicationController

	def index
		@gifs = Gif.all
		render json: {status: 'SUCCESS', message: "gifs loaded", data: @gifs}, status: :ok
	end

	def show 
		@gif = Gif.find(params[:id])
		render json: {status: 'SUCCESS', message: "gif loaded", data: @gif}, status: :ok
	end

	def create
		gifs = params.require(:gifs)
		savedGifs = []
		# binding.pry
		# FIND OR CREATE BY
		gifs.each do |gif|
			@gif = Gif.new(gif.permit(:url))
			if @gif.save
				savedGifs.push(@gif)
			else
				render json: {status: 'ERROR', message: "unprocessable_entity", data: @gif.errors}, status: :unprocessable_entity
			end
		end
		render json: {status: 'SUCCESS', message: "gifs created", data: savedGifs}, status: :ok
	end

	def update
		@gif = Gif.find(params[:id])
		if @gif.update_attributes(gif_params)
			render json: {status: 'SUCCESS', message: "gif updated", data: @gif}, status: :ok
		else
			render json: {status: 'ERROR', message: "unprocessable_entity", data: @gif.errors}, status: :unprocessable_entity
		end
	end

	def destroy
		@gif = Gif.find(params[:id])
			# binding.pry
		if @gif.destroy
			render json: {status: 'SUCCESS', message: "gif deleted", data: @gif}, status: :ok
		else
			render json: {status: 'ERROR', message: "unprocessable_entity", data: @gif.errors}, status: :unprocessable_entity
		end
	end


	private

	def gif_params
		params.require(:gif).permit(:url)
	end


end
