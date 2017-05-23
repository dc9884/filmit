class AddBookedEndToPermit < ActiveRecord::Migration[5.0]
  def change
    add_column :permits, :booked_end, :datetime
  end
end
