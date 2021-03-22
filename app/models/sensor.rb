class Sensor < ApplicationRecord
  validates :name, presence: true
  validates :lat, presence: true
  validates :long, presence: true

  has_many :events
end
