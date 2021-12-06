class CreateInventoryproducts < ActiveRecord::Migration[6.1]
  def change
    create_table :inventoryproducts do |t|
      t.integer :quantity
      t.references :inventory, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
