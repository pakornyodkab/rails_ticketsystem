class Timetable < ApplicationRecord
  belongs_to :movie
  belongs_to :theater
  has_many :tickets

  def to_label
    "Movie:#{Movie.find(movie_id).name} Theater:#{Theater.find(theater_id).name} Start:#{datetime_start}"
  end

  def self.findtodaytimetable(movieID,theaterID)
    return Timetable.where(movie_id:movieID,theater_id:theaterID,datetime_start:Date.today.all_day)
  end
end
