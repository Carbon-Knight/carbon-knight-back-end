module Queries
  class FetchUserCarMonthFootprint < Queries::BaseQuery
    type Types::CarMonthlyMileage, null: true

    argument :user_id, Integer, required: true
    argument :month, String, required: true

    def resolve(user_id:, month:)
      car = Car.find_by(user_id: user_id)
      car.car_monthly_mileages.find_by(month: month)
    end
  end
end
