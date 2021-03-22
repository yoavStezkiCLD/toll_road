# frozen_string_literal: true

module Error
  class Unauthorized < BaseError
    def initialize(message)
      super(:unauthorized, message)
    end
  end
end
