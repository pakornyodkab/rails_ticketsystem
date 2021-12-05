class DropBeveragesTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :beverages
  end
end
