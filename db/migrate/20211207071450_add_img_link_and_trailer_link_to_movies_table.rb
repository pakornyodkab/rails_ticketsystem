class AddImgLinkAndTrailerLinkToMoviesTable < ActiveRecord::Migration[6.1]
  def change
    add_column :movies,:imagelink ,:string
    add_column :movies,:trailerlink ,:string
  end
end
