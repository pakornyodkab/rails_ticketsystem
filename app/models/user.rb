class User < ApplicationRecord
	has_secure_password
	has_one :inventory
	has_many :orders
	validates :username, presence: true ,uniqueness:true
	validates :password ,presence:true
	validates :firstname ,presence:true
	validates :lastname , presence:true
end
