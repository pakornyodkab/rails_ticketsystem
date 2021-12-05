class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :productable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
