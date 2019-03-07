class User < ApplicationRecord
	has_secure_password

	validates :username, :password, :email, presence: true 
	validates :username, :uniqueness => true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
	
	has_many :relationships#, dependent: :delete_all
	has_many :contacts, through: :relationships

	has_many :user_gifs 
	has_many :gifs, through: :user_gifs

	has_many :sent_messages, :class_name => "Message",  :foreign_key => "sender_id"
	has_many :received_messages, :class_name => "Message",  :foreign_key => "receiver_id"

	def user_messages
    	Message.where("user_id = ? OR contact_id = ?", self.id, self.id)
	end
	
	def potential_contacts 
		potential = []
		User.all.each do |user| 
			if self.contacts.exclude?(user)
				potential.push(user)
			end
		end
		potential
	end

	class << self
		def by_email_or_username(email:, username:)
	      User.where('email = ? OR username = ?', email, username).first
	    end
	end


end

