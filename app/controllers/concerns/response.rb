module Response
	def json_response(object, status = :ok, **kwargs)
		render json: object, status: status, **kwargs
	end

	def empty_response(status = :no_content, **kwargs)
		head status, **kwargs
	end
end