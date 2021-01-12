class Footprint < ApplicationRecord
  has_one :car_monthly_mileage

  validates :carbon_in_kg,
            :offset_cost_total,
            :offset_cost_currency, presence: true

  def self.aggregate_footprint_for_month(user_id, month, year)
    #If we add another service(flight?)
    #it would have to be added in the the second where method if the flight
    #table also has a carbon_in_kg column if not this active record
    #call may have to be redone

    aggregate_footprint = CarMonthlyMileage.joins(:car, :footprint)
    .select("user_id","carbon_in_kg")
    .where("LOWER(month) = ?", "#{month.downcase}")
    .where(year: year, cars: {user_id: user_id})
    .sum("carbon_in_kg")

    {carbon_in_kg: aggregate_footprint}
  end
end
