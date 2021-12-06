class Product < ApplicationRecord
  belongs_to :productable, polymorphic: true
  has_many :inventoryproducts
  has_many :inventories ,through: :inventoryproducts
  has_many :orderlines
end
