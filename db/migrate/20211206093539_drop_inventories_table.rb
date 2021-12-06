class DropInventoriesTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :inventories
  end
end
