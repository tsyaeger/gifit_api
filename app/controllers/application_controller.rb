require 'auth'

class ApplicationController < ActionController::API
    include ::ActionController::Serialization
    include Response
    include ExceptionHandler
    
    before_action :authenticate
    attr_accessor :current_user

    def logged_in?
      set_current_user
      !!@current_user
    end

    def current_user
      @current_user
    end

    def set_current_user
      if has_valid_auth_type?
        user = User.find_by(email: auth_secret[:email])
        if user
          @current_user = user
        end
      end
    end

    def authenticate
      unless logged_in?
        render json: {
            success: false,
            error: 'Invalid credentials'
        }, status: :unauthorized
      end
    end

    def fallback_index_html
      render :file => 'public/index.html'
    end

    private
      
      def auth_header
        request.headers['Authorization'].to_s.scan(/Bearer (.*)$/).flatten.last
      end

      def has_valid_auth_type?
        !!request.headers['Authorization'].to_s.scan(/Bearer/).flatten.first
      end

      def auth_secret
        Auth.decode(auth_header) || {}
      end
end
