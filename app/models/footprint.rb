class Footprint < ApplicationRecord
  has_one :car_monthly_mileage

  validates :carbon_in_kg,
            :offset_cost_total,
            :offset_cost_currency, presence: true

  def self.aggregate_footprint_for_year(user_id, year)
    Footprint.joins(car_monthly_mileage: :car)
    .select('car_monthly_mileages.month')
    .where('cars.user_id = ? AND car_monthly_mileages.year = ?', "#{user_id}", "#{year}")
    .group(:month)
    .sum('carbon_in_kg')
  end
end
