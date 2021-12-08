class Movie < ApplicationRecord
	has_many :timetables
	has_many :theaters ,through: :timetables

	def self.nowshowingmovies
		return Movie.where("date_in < ?",Date.current).and(Movie.where("date_out > ?",Date.current))
	end

	def theatershow(movie_id)
		return Movie.find(movie_id).theaters.distinct
	end
end
