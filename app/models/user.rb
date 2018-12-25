class User < ApplicationRecord
	# has_secure_password

	# validates :username, :password, :email, presence: true 
	# validates :username, :uniqueness => true
	# validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
	
	# has_many :relationships#, dependent: :delete_all
	# has_many :contacts, through: :relationships

	# has_many :user_gifs 
	# has_many :gifs, through: :user_gifs

	# has_many :sent_messages, :class_name => "Message",  :foreign_key => "sender_id"
	# has_many :received_messages, :class_name => "Message",  :foreign_key => "receiver_id"



	# def potential_contacts 
	# 	potential = []
	# 	User.all.each do |u| 
	# 		if self.contacts.exclude?(u)
	# 			potential.push(u)
	# 		end
	# 	end
	# 	potential
	# end


end

