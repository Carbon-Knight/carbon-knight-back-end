module Types
  class FootprintType < Types::BaseObject
    field :id, ID, null: false
    field :carbon_in_kg, Float, null: true
    field :offset_cost_total, Float, null: true
    field :offset_cost_currency, String, null: true
    field :created_at, String, null: true
    field :created_at, String, null: true
    field :car_monthly_mileage, Types::CarMonthlyMileage, null: true
  end
end
