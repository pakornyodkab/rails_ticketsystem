class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :genre
      t.date :date_in
      t.date :date_out
      t.integer :duration
      t.string :imagelink
      t.string :trailerlink

      t.timestamps
    end
  end
end
