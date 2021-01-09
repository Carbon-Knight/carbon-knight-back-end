module Types
  class CarType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :make, String, null: true
    field :model, String, null: true
    field :year, Integer, null: true
    field :mpg, Integer, null: false
    field :fuel_type, String, null: false
    field :car_monthly_mileage, Types::CarMonthlyMileage, null: true
  end
end
