class Api::V1::RelationshipsController < ApplicationController

	def index
		# @relationships = Relationship.all
		@relationships = current_user.contacts
		json_response(@relationships)
	end

	def show 
		@relationship = Relationship.find(params[:id])
		json_response(@relationship)
	end

	def create
		# HOW TO USE PRIVAT STONG PARAMS?
		@savedRelationships = []
		relationships = params[:relationships]
		relationships.each do |relationship|
			# FIND OR CREATE BY
			@relationship = Relationship.new(:user_id => current_user.id, :contact_id => relationship[:id])
			if @relationship.save
				@savedRelationships.push(@relationship)
				current_user.relationships.push(@relationship)
			else
				render json: {status: 'ERROR', message: "unprocessable_entity", data: @relationship.errors}, status: :unprocessable_entity
			end
		end
		@new_contacts = @savedRelationships.map {|r| r.contact_id}
		json_response(@new_contacts)
	end



	def destroy
		# binding.pry
		@relationship = Relationship.find_by(user_id: current_user.id, contact_id: params[:contactId])
		@relationship.destroy
		empty_response
	end


	private

	def relationship_params
		params.require(:relationship).permit(:user_id, :contact_id)
	end

end
