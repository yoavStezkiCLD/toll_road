class CreateTransactionsEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions_events, id: false do |t|
      t.belongs_to :transaction
      t.belongs_to :event
    end
  end
end
