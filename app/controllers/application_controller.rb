# frozen_string_literal: true

class Unauthorized < StandardError; end

class ApplicationController < ActionController::API
  rescue_from Error::BaseError do |error|
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
end
