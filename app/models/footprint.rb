class Footprint < ApplicationRecord
  belongs_to :car_monthly_mileage
  validates :carbon_in_kg,
            :offset_cost_total,
            :offset_cost_currency, presence: true
end
