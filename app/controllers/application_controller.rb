# frozen_string_literal: true

require_relative '../lib/errors/common_error'

class ApplicationController < ActionController::API
  include CommonError
  before_action :find_current_account

  rescue_from CommonError::BaseError do |error|
    render_error(error.status, error.message)
  end

  def render_success(message, data)
    render json: { status: 'Success', message: message, data: data }, status: :ok
  end

  def render_error(status, errors)
    render json: { status: 'ERROR', message: errors }, status: status
  end

  def admin_token?
    token_data = AuthorizeApiRequest.authorize?(request.headers)
    token_data && token_data[:is_admin]
  end

  private

  def find_current_account
    token_data = AuthorizeApiRequest.authorize?(request.headers)
    begin
      Current.account = Account.find(token_data['account_id'])
    rescue ActiveRecord::RecordNotFound
      raise CommonError::Unauthorized, 'Token Unauthorized'
    end
  end
end


