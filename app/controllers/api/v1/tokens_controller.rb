module Api
  module V1
    class TokensController < ApplicationController
      skip_before_action :find_current_account, only: [:create]

      def create
        token = JsonWebToken.encode({ is_admin: params[:is_admin], account_id: params[:account_id] }, 24.hours.from_now)
        render_success('Created Token', token)
      end
    end
  end
end