# frozen_string_literal: true

module Error
  class Conflict < BaseError
    def initialize(message)
      super(:conflict, message)
    end
  end
end
