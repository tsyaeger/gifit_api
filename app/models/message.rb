class Message < ApplicationRecord
	has_many :gif_messages 
	has_many :gifs, through: :gif_messages
	# belongs_to :sender, :class_name => "User"
	# belongs_to :receiver, :class_name => "User"

	# validates :gifs, :presence => true

	accepts_nested_attributes_for :gifs

	scope :unsent, -> { where('sent = ?',false) }
	scope :sent, -> { where('sent = ?',true) }

	last_week = 1.week.ago
	scope :msgs_last_week, -> { where('updated_at >= ?', last_week) }


	# def sender_name
	#  	self.sender ? self.sender.username : nil
	# end

	# def receiver_name
	# 	self.receiver ? self.receiver.username : nil
	# end



end
