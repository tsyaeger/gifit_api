class Api::V1::RelationshipsController < ApplicationController

	def index
		# binding.pry
		@relationships = Relationship.all
		# render json: {status: 'SUCCESS', message: "relationships loaded", data: @relationships}, status: :ok
		render json: @relationships, status: 200
	end


	def show 
		@relationship = Relationship.find(params[:id])
		render json: @relationship, status: 200
	end

	def create
		# HOW TO USE PRIVAT STONG PARAMS?
		# binding.pry
		relationship_params = params.require(:relationship_params)
		savedRelationships = []
		relationships.each do |relationship|

			# FIND OR CREATE BY
			@relationship = Relationship.new(relationship.permit(:url))
			if @relationship.save
				savedRelationships.push(@relationship)
				current_user.relationships.push(@relationship)
			else
				render json: {status: 'ERROR', message: "unprocessable_entity", data: @relationship.errors}, status: :unprocessable_entity
			end
		end
		# binding.pry
		render json: @relationships, status: 200
		# render json: {status: 'SUCCESS', message: "relationships created", data: savedRelationships}, status: :ok
	end


	def destroy
		@relationship = Relationship.find(params[:id])
		@relationship.delete
		render json: {relationshipId: @relationship.id}
	end


	private

	def relationship_params
		params.require(:relationship).permit(:user_id, :contact_id)
	end

end
