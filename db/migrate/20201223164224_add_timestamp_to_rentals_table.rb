class AddTimestampToRentalsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :created_at, :datetime, null: false
    add_column :rentals, :updated_at, :datetime, null: false 
  end
end
