class RelationshipSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :contact_id, :contact

 #  	belongs_to :user
	# belongs_to :contact, :class_name => "User"
end


# contact username