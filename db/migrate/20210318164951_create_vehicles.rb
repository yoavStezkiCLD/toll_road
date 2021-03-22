# frozen_string_literal: true

class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.belongs_to :account, index: true, foreign_key: true
      t.string :plate_number, null: false, limit: 15

      t.index ['plate_number'], name: 'index_vehicles_on_plate_number', unique: true

      t.timestamps
    end
  end
end
