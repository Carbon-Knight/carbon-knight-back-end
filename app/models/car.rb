class Car < ApplicationRecord
  validates :user_id,
            :make,
            :model,
            :year,
            :mpg,
            :fuel_type, presence: true
  has_many :car_monthly_mileages
end
