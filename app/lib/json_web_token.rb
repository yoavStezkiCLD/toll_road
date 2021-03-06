# frozen_string_literal: true

class JsonWebToken
  class << self
    def encode(payload, exp = nil)
      payload[:exp] = exp.to_i if exp.present?
      payload[:is_admin] = false if payload[:is_admin].nil?
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode(token)
      JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    end
  end
end
