class Account < ApplicationRecord
  has_many :vehicles, dependent: :destroy
  has_many :events, dependent: :destroy

  after_create :create_vehicle, :enrich_account_data

  enum subscription_type: [:daily, :monthly]

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
