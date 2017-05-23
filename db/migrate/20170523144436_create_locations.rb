class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :location_name
      t.integer :location_size
      t.boolean :location_private
      t.boolean :location_explosions
      t.string :location_address

      t.timestamps

    end
  end
end
