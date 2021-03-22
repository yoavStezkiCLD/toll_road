# frozen_string_literal: true

module Error
  class BaseError < StandardError
    attr_reader :status, :message

    def initialize(status = nil, message = nil)
      super()
      @status = status || :internal_server_error
      @message = message || 'Something went wrong'
    end
  end
end


