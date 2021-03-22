module Api
  module V1
    class TokensController < ApplicationController
      def create
        render_success('Created Token', JsonWebToken.encode({ is_admin: params[:is_admin] }));
      end
    end
  end
end