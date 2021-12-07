class Theater < ApplicationRecord
	has_many :chairs
	has_many :timetables
	has_many :movies ,through: :timetables
end
