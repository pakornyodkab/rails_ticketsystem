class Timetable < ApplicationRecord
  belongs_to :movie
  belongs_to :theater
  has_many :tickets

  def to_label
    "Movie:#{Movie.find(movie_id).name} Theater:#{Theater.find(theater_id).name} Start:#{datetime_start}"
  end
end
