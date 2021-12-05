class CreateBeverages < ActiveRecord::Migration[6.1]
  def change
    create_table :beverages do |t|
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end
