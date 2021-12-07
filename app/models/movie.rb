class Movie < ApplicationRecord
	has_many :timetables
	has_many :theaters ,through: :timetables

	def self.nowshowingmovies
		return Movie.where("date_in < ?",Date.current).and(Movie.where("date_out > ?",Date.current))
	end
end
