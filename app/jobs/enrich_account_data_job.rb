# frozen_string_literal: true

class EnrichAccountDataJob < ApplicationJob
  def perform(account_id)
    Account.update(
      account_id,
      {
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        id_number: Faker::IDNumber.valid
      }
    )
  end
end
