module ExceptionHandler
	extend ActiveSupport::Concern

	included do
		rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError do |e|
			json_response({ error: "not found" }, :not_found)
		end

		rescue_from ActionController::ParameterMissing, ActiveRecord::RecordInvalid do |e|
			json_response({ error: e.message }, :unprocessable_entity)
		end
	end
end