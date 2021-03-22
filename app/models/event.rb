class Event < ApplicationRecord
  validates :plate_number, presence: true
  validates :sensor_id, presence: true
  validates :account_id, presence: true

  has_one :sensor
  has_one :account
end
