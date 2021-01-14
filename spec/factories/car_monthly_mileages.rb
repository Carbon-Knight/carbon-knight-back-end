FactoryBot.define do
  factory :car_monthly_mileage do
      month {['January', 'Febuary', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'].sample }
      year {Faker::Vehicle.year}
      total_mileage {Faker::Number.within(range: 100..200)}
      car

      trait :with_footprint do
        before :create do |car_monthly_mileage|
          create(:footprint, car_monthly_mileage: car_monthly_mileage)
        end
      end
    end
  end
