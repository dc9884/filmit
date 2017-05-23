class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.string :production_id
      t.integer :user_id

      t.timestamps

    end
  end
end
