require 'jwt'

class Auth
  ALGORITHM = 'HS256'

  class << self
    def issue(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, auth_secret, ALGORITHM)
    end

    def decode(token)
      body = JWT.decode(token, auth_secret, true, { algorithm: ALGORITHM })[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end

    def auth_secret
       Rails.application.secrets.secret_key_base || ENV['AUTH_SECRET']
    end
  end
end