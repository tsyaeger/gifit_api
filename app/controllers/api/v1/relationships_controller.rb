class Api::V1::RelationshipsController < ApplicationController

	def index
		@relationships = Message.all
		render json: @relationships, status: 200
	end

	def show 
		@relationship = Relationship.find(params[:id])
		render json: @relationship, status: 200
	end

	def create
		@relationship = Relationship.create(relationship_params)
		render json: @relationship, status: 200
	end

	def update
		@relationship = Relationship.find(params[:id])
		@relationship.update(relationship_params)
		render json: @relationship, status: 200
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
