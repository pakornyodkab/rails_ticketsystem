json.extract! timetable, :id, :datetime_start, :datetimestop, :movie_id, :theater_id, :created_at, :updated_at
json.url timetable_url(timetable, format: :json)
