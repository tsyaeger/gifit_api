class Gif < ApplicationRecord
	has_many :gif_messages
	has_many :messages, through: :gif_messages

	has_many :user_gifs, dependent: :destroy
	has_many :users, through: :user_gifs

	# validates :url, format: { with: /(http.*)(.*giphy.gif.cid=*)/} 
	# validates :url, uniqueness: true #ensure that user still gets gif added rather than error
end
