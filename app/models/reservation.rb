class Reservation < ApplicationRecord
  belongs_to :table
  validate :should_not_overlap, :valid_slot#, on: :create
  #validate :valid_slot, on: :update

  def should_not_overlap
    if table.reservations.where("time_from <= ? AND time_to > ? AND NOT id = ?", time_from, time_from, id).count > 0
      errors.add(:time_from, "shouldn't overlap with existing reservation")
    end
    if table.reservations.where("time_from < ? AND time_to >= ? AND NOT id = ?", time_to, time_to, id).count > 0
      errors.add(:time_from, "shouldn't overlap with existing reservation")
    end
    if table.reservations.where("time_from >= ? AND time_to <= ? AND NOT id = ?", time_from, time_to, id).count > 0
      errors.add(:time_from, "shouldn't overlap with existing reservation")
    end
  end

  def valid_slot
    if !(table.restaurant.open?(time_from, time_to))
      errors.add(:time_from, "Invalid time slot #{time_from}")
      errors.add(:time_to, "Invalid time slot #{time_to}")
    end
  end
end
