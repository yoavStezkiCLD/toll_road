class AuthorizeApiRequest
  class << self
    def authorize?(headers)
      http_auth_header = http_auth_header(headers)
      JsonWebToken.decode(http_auth_header)
    end

    private

    def http_auth_header(headers)
      if headers['Authorization'].present?
        headers['Authorization'].split(' ').last
      else
        raise CommonError::Unauthorized, 'Token Unauthorized'
      end
    end
  end
end
