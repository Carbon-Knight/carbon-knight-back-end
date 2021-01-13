class CarMonthlyMileage < ApplicationRecord
  belongs_to :car
  belongs_to :footprint

  validates :car_id,
            :footprint_id,
            :total_mileage,
            :month,
            :year, presence: true


  class << self
    def fetch_all_user_car_monthly_mileages(user_id)
      joins(:car).where(cars: {user_id: user_id})
    end

    def fetch_user_years(user_id)
      select(car_monthly_mileages: :year)
        .joins(:car)
        .where(cars: {user_id: user_id})
        .distinct(car_monthly_mileages: :year)
        .order(year: :asc)
        .pluck(:year)
    end
  end
end
