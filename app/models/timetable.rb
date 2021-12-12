class Timetable < ApplicationRecord
  belongs_to :movie
  belongs_to :theater
  has_many :tickets

  def to_label
    "Movie:#{Movie.find(movie_id).name} Theater:#{Theater.find(theater_id).name} Start:#{datetime_start}"
  end

  def self.findtodaytimetable(movieID,theaterID)
    return Timetable.where(movie_id:movieID,theater_id:theaterID,datetime_start:Date.current.all_day)
  end

  def usedchair_id
    usedchair_id = []
    all_tickets = self.tickets
    all_tickets.each do |ticket|
      usedchair_id.append(ticket.chair.id)
    end 
    return usedchair_id
  end

  def availablechair_id
    return self.theater.chairs.map{|chair| chair.id} - self.usedchair_id
  end

  
end
