module Types
  class CarMonthlyMileage < Types::BaseObject
    field :id, ID, null: false
    field :car_id, Integer, null: true
    field :footprint_id, Integer, null: true
    field :total_mileage, Integer, null: true
    field :month, String, null: true
    field :year, String, null: true
    field :footprint, Types::FootprintType, null: true
  end
end
