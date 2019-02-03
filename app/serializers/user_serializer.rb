class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :gifs, :contacts, :sent_messages, :received_messages

	has_many :relationships#, dependent: :delete_all
	has_many :contacts, through: :relationships

	has_many :user_gifs 
	has_many :gifs, through: :user_gifs

	has_many :sent_messages, :class_name => "Message",  :foreign_key => "sender_id"
	has_many :received_messages, :class_name => "Message",  :foreign_key => "receiver_id"


  # def gifs 
  #   self.object.gifs.map do |gif|
  #     {url: gif.url}
  #   end 
  # end 

end
