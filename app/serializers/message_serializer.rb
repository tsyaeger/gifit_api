class MessageSerializer < ActiveModel::Serializer
  attributes :id, :header, :footer,:sent, :gifs, :created_at, :updated_at, :sender_id, :receiver_id, :sender, :receiver

	has_many :gif_messages 
	has_many :gifs, through: :gif_messages

	belongs_to :sender, :class_name => "User"
	belongs_to :receiver, :class_name => "User"
end

