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

    aggregate_footprint = Footprint.joins(car_monthly_mileage: :car)
    .where("LOWER(month) = ?", "#{month.downcase}")
    .where(car_monthly_mileages: {year: year}, cars: {user_id: user_id})
    .sum('carbon_in_kg')

    {carbon_in_kg: aggregate_footprint}
  end

  def self.aggregate_footprint_for_year(user_id, year)
    Footprint.joins(car_monthly_mileage: :car)
    .select('car_monthly_mileages.month')
    .where('cars.user_id = ? AND car_monthly_mileages.year = ?', "#{user_id}", "#{year}")
    .group(:month)
    .sum('carbon_in_kg')
  end
end
