# frozen_string_literal: true

require_relative '../lib/errors/common_error'

class MonthlyPaymentMailer < ApplicationMailer
  include CommonError

  def monthly_payment_mail
    email = Current.account.email
    raise CommonError::EmailNotFound unless email

    # should sent to env email for development env
    email = ENV['DEV_INBOX'] if ENV['RAILS_ENV'] == 'development'

    token = JsonWebToken.encode({ account_id: Current.account.id })

    @account = Current.account
    @month = Date.today.month
    @year = Date.today.year
    @report_link = "#{ENV['RAILS_RELATIVE_URL_ROOT']}/report/#{token}"

    mail(to: email, subject: 'Monthly Payment Report From Toll Road LTD')
  end
end
