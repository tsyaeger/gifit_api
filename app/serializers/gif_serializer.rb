class GifSerializer < ActiveModel::Serializer
  attributes :id, :url

	# has_many :gif_messages
	# has_many :messages, through: :gif_messages

	# has_many :user_gifs
	# has_many :users, through: :user_gifs
end
