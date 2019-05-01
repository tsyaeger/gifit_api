class Api::V1::GifsController < ApplicationController

	def index
		@gifs = current_user.gifs.order(:created_at)
		json_response(@gifs) || empty_response
	end

	def create
		@saved_gifs = []
		urls = gifs_params["gifs_attributes"].map {|gif| gif[:url]}
		urls.each do |url|
			@gif = Gif.find_or_create_by(url: url)
			if !current_user.gifs.include?(@gif)
				current_user.gifs.push(@gif)
			end
			@saved_gifs.push(@gif)
		end
		json_response(@saved_gifs) || empty_response
	end

	def destroy
		@gif = Gif.find(params[:id])
		if current_user.gifs.includes(@gif)
			current_user.gifs.delete(@gif)
			empty_response
		end
	end

	private

	def gifs_params
		params.require(:gif).permit(gifs_attributes: [:url])
	end
end
