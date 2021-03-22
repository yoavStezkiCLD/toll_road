class CreateSensors < ActiveRecord::Migration[6.1]
  def change
    create_table :sensors do |t|
      t.string :name, null: false
      t.string :lat, null: false
      t.string :long, null: false
      t.timestamps
    end
  end
end
