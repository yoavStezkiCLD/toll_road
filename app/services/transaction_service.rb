# frozen_string_literal: true

require_relative '../../app/lib/errors/common_error'

class TransactionService
  class << self
    include CommonError

    def charge(events)
      transaction_events = TransactionsEvent.where('event_id IN (:event_ids)', { event_ids: events.ids })

      # TODO: should update...
      already_paid_events = transaction_events.records.map {}

      events_to_pay = events - already_paid_events
      total_amount = PaymentService.calculate_price(events_to_pay)

      billing_info = PaymentService.pay(total_amount)

      transaction_data = {
        status: :ok_status,
        amount: total_amount,
        reception_url: billing_info[:reception_url],
        events: events_to_pay
      }

      transaction = Transaction.new(transaction_data)
      transaction.save
      puts transaction

      {
        id: transaction.id,
        amount: transaction.amount,
        reception_url: billing_info[:reception_url]
      }
    end
  end
end
