class Inventory < ApplicationRecord
  has_many :inventoryproducts
  has_many :products ,through: :inventoryproducts
  belongs_to :user
end
