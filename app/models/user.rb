class User < ApplicationRecord

	validates :username, :password, :email, presence: true 
	validates :username, :uniqueness => true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
	
	has_many :relationships#, dependent: :delete_all
	has_many :contacts, through: :relationships

	has_many :user_gifs 
	has_many :gifs, through: :user_gifs

	has_many :sent_messages, :class_name => "Message",  :foreign_key => "sender_id"
	has_many :received_messages, :class_name => "Message",  :foreign_key => "receiver_id"


	# def potential_contacts 
	# 	potential = []
	# 	User.all.each do |user| 
	# 		if self.contacts.exclude?(user)
	# 			potential.push(user)
	# 		end
	# 	end
	# 	potential
	# end

end

