json.extract! movie, :id, :name, :genre, :date_in, :date_out, :duration, :created_at, :updated_at
json.url movie_url(movie, format: :json)
