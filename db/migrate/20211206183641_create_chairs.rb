class CreateChairs < ActiveRecord::Migration[6.1]
  def change
    create_table :chairs do |t|
      t.string :row
      t.string :seat
      t.integer :price
      t.string :chair_type
      t.references :theater, null: false, foreign_key: true

      t.timestamps
    end
  end
end
