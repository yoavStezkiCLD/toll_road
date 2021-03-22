class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :plate_number, null: false
      t.belongs_to :sensor, index: true, foreign_key: true
      t.belongs_to :account, index: true, foreign_key: true

      t.timestamps
    end
  end
end
