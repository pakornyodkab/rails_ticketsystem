class User < ApplicationRecord
	has_secure_password
	has_one :inventory
	has_many :orders
end
