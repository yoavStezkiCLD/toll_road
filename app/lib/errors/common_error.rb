# frozen_string_literal: true

module CommonError
  class BaseError < StandardError
    attr_reader :status, :message

    def initialize(status = nil, message = nil)
      super()
      @status = status || :internal_server_error
      @message = message || 'Something went wrong'
    end
  end

  class InvalidParams < BaseError
    def initialize(message)
      super(:not_acceptable, message)
    end
  end

  class Conflict < BaseError
    def initialize(message)
      super(:conflict, message)
    end
  end

  class TransactionFailed < BaseError
    def initialize(message)
      super(:bad_request, message)
    end
  end

  class Unauthorized < BaseError
    def initialize(message)
      super(:unauthorized, message)
    end
  end

  class EmailNotFound < BaseError
    def initialize(message)
      super(:bad_request, message)
    end
  end

  class GeneralError < BaseError
    def initialize(message)
      super(:bad_request, message)
    end
  end
end


