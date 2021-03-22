class Vehicle < ApplicationRecord
  validates :plate_number, presence: true
  validates :account_id, presence: true

  belongs_to :account
end
