class CreatePermits < ActiveRecord::Migration[5.0]
  def change
    create_table :permits do |t|
      t.integer :movie_id
      t.integer :location_id
      t.datetime :booked_time
      t.integer :user_id

      t.timestamps

    end
  end
end
