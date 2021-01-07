class CarMonthlyMileage < ApplicationRecord
  belongs_to :car
  belongs_to :footprint

  validates :car_id,
            :footprint_id,
            :total_mileage,
            :month,
            :year, presence: true
end
