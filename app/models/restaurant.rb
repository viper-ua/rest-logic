class Restaurant < ApplicationRecord
  has_many :schedules, dependent: :destroy
  has_many :tables, dependent: :destroy
  has_many :reservations, through: :tables
  validates :name, presence: true

  def open?(time_from, time_to)
    (time_from >= opening_at(time_from)) and
    (time_to <= closing_at(time_from)) and
    (time_to > time_from)
   end

  def closing_at(today)
    today = today.to_datetime
    sched_today = schedules.where(weekday: today.wday)[0]
    today += 1 if sched_today.time_close < sched_today.time_open
    DateTime.new(today.year, today.month, today.day, sched_today.time_close.hour, sched_today.time_close.min)
  end

  def opening_at(today)
    today = today.to_datetime
    sched_today = schedules.where(weekday: today.wday)[0]
    DateTime.new(today.year, today.month, today.day, sched_today.time_open.hour, sched_today.time_open.min)
  end
end
