class Api::V1::GifsController < ApplicationController

	def index
		@gifs = current_user.gifs.order(:created_at)
		json_response(@gifs) || empty_response
	end

	def show 
		@gif = Gif.find(params[:id])
		json_response(@gif) || empty_response
	end

	def create
		# binding.pry
		@gifs = Gif.create(gifs_params["gifs_attributes"])
		@gifs.map { |gif| current_user.gifs.push(gif) }

		json_response(@gifs) || empty_response
	end

	def destroy
		@gif = Gif.find(params[:id])

		# DELETE ONLY FROM USER GIFS
		# if current_user.gifs.delete(@gif)
		@gif.destroy
		empty_response
	end


	private

	# def set_gif
	# 	@gif = Gif.find_by(url: params[:url])
	# end


	def gifs_params
		params.require(:gif).permit(gifs_attributes: [:url])
	end
end
