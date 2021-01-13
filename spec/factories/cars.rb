FactoryBot.define do
  factory :car do
    user_id {50}
    make {Faker::Vehicle.make}
    model {Faker::Vehicle.model}
    year {Faker::Vehicle.year}
    mpg {Faker::Number.within(range: 8..50)}
    fuel_type {'gasoline'}

    trait :with_records do
      after :create do |car|
        create_list(:car_monthly_mileage, 5, :with_footprint, car: car)
      end
    end
  end
end
