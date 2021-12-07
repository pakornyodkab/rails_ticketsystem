class Movie < ApplicationRecord
	has_many :timetables
	has_many :theaters ,through: :timetables
end
