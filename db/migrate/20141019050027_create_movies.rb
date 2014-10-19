class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.integer :movie_id
      t.integer :group_id

      t.timestamps
    end
  end
end
