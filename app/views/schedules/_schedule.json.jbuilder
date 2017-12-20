json.extract! schedule, :id, :weekday, :time_open, :time_close, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
