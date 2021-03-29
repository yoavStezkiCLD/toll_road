# Preview all emails at http://localhost:3000/rails/mailers/monthly_payment_mailer
class MonthlyPaymentMailerPreview < ActionMailer::Preview

  def monthly_payment_mail
    MonthlyPaymentMailer.with('').monthly_payment_mail.deliver_now
  end

end
