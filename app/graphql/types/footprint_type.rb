module Types
  class FootprintType < Types::BaseObject
    field :id, ID, null: false
    field :carbon_in_kg, Float, null: true
    field :offset_cost_total, Float, null: true
    field :offset_cost_currency, String, null: true
  end
end
