class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :status, null: false
      t.numeric :amount, null: false, default: 0
      t.string :reception_url, null: false
      t.timestamps
    end

  end
end
