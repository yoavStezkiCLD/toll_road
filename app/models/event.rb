class Event < ApplicationRecord
  validates :plate_number, presence: true
  validates :sensor_id, presence: true
  validates :account_id, presence: true

  belongs_to :sensor
  belongs_to :account
  has_and_belongs_to_many :event_transactions, class_name: 'Transaction'
end
