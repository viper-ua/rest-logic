json.extract! reservation, :id, :time_from, :time_to, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
