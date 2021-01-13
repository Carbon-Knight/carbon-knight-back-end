class CarMonthlyMileage < ApplicationRecord
  belongs_to :car
  belongs_to :footprint

  validates :car_id,
            :footprint_id,
            :total_mileage,
            :month,
            :year, presence: true


  def self.fetch_all_user_car_monthly_mileages(user_id)
    CarMonthlyMileage.joins(:car).where(cars: {user_id: user_id})
  end
end
