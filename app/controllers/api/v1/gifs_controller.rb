class Api::V1::GifsController < ApplicationController

	def index
		@gifs = Gif.all
		render json: @gifs, status: 200
	end

	def show 
		@gif = Gif.find(params[:id])
		render json: @gif, status: 200
	end

	def create
		@gif = Gif.create(gif_params)
		render json: @gif, status: 200
	end

	def update
		@gif = Gif.find(params[:id])
		@gif.update(gif_params)
		render json: @gif, status: 200
	end

	def destroy
		@gif = Gif.find(params[:id])
		@gif.delete
		render json: {gifId: @gif.id}
	end


	private

	def gif_params
		params.require(:gif).permit(:url)
	end
end
