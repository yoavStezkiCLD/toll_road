# frozen_string_literal: true

class Transaction < ApplicationRecord
  has_and_belongs_to_many :events

  after_create :create_transaction_events

  enum status: [:ok_status, :failed_status]

  def initialize(attributes)
    super()
    self.status = attributes[:status]
    self.amount = attributes[:amount]
    self.reception_url = attributes[:reception_url]

    @related_events = attributes[:events]
  end

  private

  def create_transaction_events
    transaction_events = @related_events.map { |event| { transaction_id: id, event_id: event.id } }
    TransactionsEvent.insert_all(transaction_events)
  end

end
