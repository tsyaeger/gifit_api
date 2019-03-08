class Api::V1::RelationshipsController < ApplicationController

	def index
		@relationships = current_user.contacts
		json_response(@relationships, @potential_contacts)
	end

	def potential_relationships
		@potential_contacts = current_user.potential_contacts
		json_response(@potential_contacts)
	end


	def show 
		@relationship = Relationship.find(params[:id])
		json_response(@relationship)
	end

	def create
		binding.pry
		@saved_contacts = []
		relationships = params[:relationships]
		relationships.each do |contactId|
			contact = User.find_by(id: contactId)
			relationship = Relationship.find_by(:user_id => current_user.id, :contact_id => contact.id) || Relationship.new(:user_id => current_user.id, :contact_id => contact.id)
			if relationship.save
				@saved_contacts.push(contact)
				current_user.relationships.push(relationship)
			end
		end
		# @new_contacts = @savedRelationships.map {|r| r.contact_id}
		json_response(@saved_contacts) || empty_response
	end



	def destroy
		@relationship = Relationship.find_by(user_id: current_user.id, contact_id: params[:contactId])
		@relationship.destroy
		empty_response
	end


	private

	def relationship_params
		params.require(:relationship).permit(:user_id, :contact_id)
	end

end
