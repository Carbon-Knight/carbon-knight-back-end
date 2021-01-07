class Footprint < ApplicationRecord
  validates :carbon_in_kg,
            :offset_cost_total,
            :offset_cost_currency, presence: true
end
