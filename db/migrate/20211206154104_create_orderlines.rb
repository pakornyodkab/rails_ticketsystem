class CreateOrderlines < ActiveRecord::Migration[6.1]
  def change
    create_table :orderlines do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
