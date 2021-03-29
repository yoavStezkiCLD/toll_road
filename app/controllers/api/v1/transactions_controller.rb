# frozen_string_literal: true

require_relative '../../../lib/errors/common_error'
require_relative '../../../../config/initializers/my_constants'

module Api
  module V1
    class TransactionsController < ApplicationController
      include CommonError
      include Constants

      def charge
        month = params[:month]
        raise CommonError::InvalidParams, 'Given month is out of range 1 - 12' if month.nil? || month < 1 || month > 12

        current_year = Date.today.year
        year = params[:year] || current_year
        if year > current_year || year < Constants::MIN_YEAR
          raise CommonError::InvalidParams, "Given year is out of range 1970 - #{Constants::MIN_YEAR}"
        end

        from = Date.new(year, month).at_beginning_of_month
        to = from.at_end_of_month

        events = EventService.events_by_date(from, to)
        transaction_info = TransactionService.charge(events)

        render_success('Charge Success', transaction_info)
      end
    end
  end
end
