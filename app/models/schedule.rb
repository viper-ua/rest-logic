class Schedule < ApplicationRecord
  belongs_to :restaurant
  enum weekday: {
    "Mon" => 1,
    "Tue" => 2,
    "Wed" => 3,
    "Thu" => 4,
    "Fri" => 5,
    "Sat" => 6,
    "Sun" => 0    
  }
end
