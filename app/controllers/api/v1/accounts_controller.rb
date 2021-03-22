# frozen_string_literal: true

module Api
  module V1
    class AccountsController < ApplicationController
      before_action :admin_token?
      before_action :find_account, only: [:update]

      def create
        plate_number = params[:plate_number]
        unless Vehicle.find_by({ plate_number: plate_number }).nil?
          raise Error::Conflict, "Unable to create vehicle with plate number #{plate_number}"
        end

        @account = Account.new(plate_number)
        if @account.save
          render_success('Created Account', @account)
        else
          render_error(:unprocessable_entity, @account.errors)
        end
      end

      def update
        if @account.update(account_params)
          render_success('Updated Account', @account)
        else
          render_error(:unprocessable_entity, @account.errors)
        end
      end

      def destroy
        # TODO: should complete later
      end

      private

      def find_account
        account_id = params[:id]
        @account = Account.find(account_id)
        render_error(:not_found, "Unable to find account with id #{account_id}") unless @account.nil?
      end

      def account_params
        params.require('account').permit(:first_name, :last_name, :subscription_type)
      end

    end
  end
end
