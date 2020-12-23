class AddColumnMovieIdToVhs < ActiveRecord::Migration[5.2]
  def change
    add_column :vhs, :movie_id, :integer
  end
end
