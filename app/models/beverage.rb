class Beverage < ApplicationRecord
	has_one :product ,as: :productable
end
