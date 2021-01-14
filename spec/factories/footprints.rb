FactoryBot.define do
  factory :footprint do
    carbon_in_kg {Faker::Number.within(range: 2..8)}
    offset_cost_total {Faker::Number.within(range: 15..50 )}
    offset_cost_currency {'USD'}
  end
end
