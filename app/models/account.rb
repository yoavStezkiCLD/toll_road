class Account < ApplicationRecord
  # validates :first_name, presence: true
  # validates :last_name, presence: true

  has_many :vehicles, dependent: :destroy
  has_many :events

  after_create :create_vehicle, :enrich_account_data

  enum subscription_type: [:daily, :monthly]
  # attr_accessor :subscription_type

  def initialize(plate_number)
    super()
    @plate_number = plate_number
  end

  private

  def create_vehicle
    vehicles.push(Vehicle.new({ plate_number: @plate_number, account_id: id }))
  end

  def enrich_account_data
    EnrichAccountDataJob.perform_later(id)
  end
end
