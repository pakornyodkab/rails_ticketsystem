class AddChairtypeToChair < ActiveRecord::Migration[6.1]
  def change
    add_column :chairs ,:chair_type ,:string
    remove_column :chairs ,:type ,:string
  end
end
