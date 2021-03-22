# frozen_string_literal: true

module Api
  module V1
    class EventsController < ApplicationController
      def create
        plate_number = params[:plate_number]
        @account = Account
                   .joins(:vehicles)
                   .where('vehicles.plate_number = ?', plate_number)
                   .first_or_create(plate_number)

        event = Event.new(event_param)

        event.save ? render_success('Created Event', event) : render_error(:unprocessable_entity, event.errors)
      end

      private

      def event_param
        params.require('event').permit(:sensor_id, :plate_number).merge({ account_id: @account.id })
      end
    end
  end
end
