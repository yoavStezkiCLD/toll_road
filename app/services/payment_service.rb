# frozen_string_literal: true

require_relative '../lib/errors/common_error'

class PaymentService
  DAILY_PRICE = 5
  MONTHLY_PRICE = 2.5

  class << self
    include CommonError

    def calculate_price(events)
      Current.account.subscription_type == :daily.to_s ? DAILY_PRICE * events.length : MONTHLY_PRICE * events.length
    end

    def pay(amount)
      billing_info = billing_http_call(amount)
      raise CommonError::TransactionFailed, billing_info.error if billing_info[:status] == :failed_status

      billing_info
    end

    private

    def billing_http_call(amount)
      # should call to any payment service

      {
        status: :ok_status,
        reception_url: Faker::Internet.url
      }
    end

  end
end
