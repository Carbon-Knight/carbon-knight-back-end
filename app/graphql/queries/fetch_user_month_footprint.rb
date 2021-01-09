module Queries
  class FetchUserMonthFootprint < Queries::BaseQuery
    type [Types::FootprintType], null: true
    #field :fetch_user_month_footprint, [FootprintType], null: true
    argument :user_id, Integer, required: true
    argument :month, String, required: true

    def resolve(user_id:, month:)
      car = Car.find(user_id)
      car_monthly_mileage = car.car_monthly_mileages.find_by(month: month)
      footprint = car_monthly_mileage.footprint
      footprint
      car
    end
  end
end
