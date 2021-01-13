module Types
  class YearlyFootprintType < Types::BaseObject
    field :month, String, null: false
    field :carbon_in_kg, Float, null: true
  end
end
