class CarMonthlyMileage < ApplicationRecord
  belongs_to :car
  has_one :footprint

  validates :car_id,
            :total_mileage,
            :month,
            :year, presence: true
end
