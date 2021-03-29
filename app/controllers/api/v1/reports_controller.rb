# frozen_string_literal: true

require_relative '../../../lib/errors/common_error'
require_relative '../../../../config/initializers/my_constants'

module Api
  module V1
    class ReportsController < ApplicationController
      include CommonError
      include Constants

      def monthly_report
        raise CommonError::GeneralError, 'General Error' unless Current.account.id_number == params[:id_number]

        month = params[:month] || -1.month.from_now.month
        if month < 1 || month > 12
          raise CommonError::InvalidParams, 'Given month is out of range 1 - 12'
        end

        current_year = Date.today.year
        year = params[:year] || current_year
        if year > current_year || year < Constants::MIN_YEAR
          raise CommonError::InvalidParams, "Given year is out of range 1970 - #{Constants::MIN_YEAR}"
        end

        from = Date.new(year, month).at_beginning_of_month
        to = from.at_end_of_month

        events = EventService.events_by_date(from, to, [:sensor])

        total_amount = PaymentService.calculate_price(events)

        report_items = events.map do |event|
          {
            id: event.id,
            detection_time: event.created_at,
            plate_number: event.plate_number,
            sensor: { name: event.sensor.name, location: { lat: event.sensor.lat, long: event.sensor.long } }
          }
        end

        render_success('Monthly Report', { report_items: report_items, total_amount: total_amount })
      end
    end
  end
end