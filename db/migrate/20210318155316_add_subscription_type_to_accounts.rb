class AddSubscriptionTypeToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :subscription_type, :integer, default: 0
  end
end
