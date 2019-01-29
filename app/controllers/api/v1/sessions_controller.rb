require 'auth'

module Api
  module V1
      class SessionsController < ApplicationController
          skip_before_action :authenticate, only: [:create]

          def create
            # binding.pry
            user = User.by_email_or_username(
                email: auth_params[:email],
                username: auth_params[:username]
            )
            if user.present? && user.authenticate(auth_params[:password])
                jwt = Auth.issue({email: user.email}, Time.now + 1.year)
                render json: {
                    success: true,
                    token: jwt
                }, status: :created
            else
              render json: {
                  success: false,
                  error: 'Invalid Credentials'
              }, status: :unauthorized
            end
          end

          private

          def auth_params
            params.require(:user).permit(:email, :username, :password)
          end
      end
  end
end


# eyJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImF1QGdtYWlsLmNvbSIsImV4cCI6MTU4MDI2MzkzMn0.gc4lm3viFIUscoWFPJUvz9YWRc8HAEzFUfsWlHk7k3E