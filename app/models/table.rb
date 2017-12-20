class Table < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :restaurant
  validates :name, presence: true
end
