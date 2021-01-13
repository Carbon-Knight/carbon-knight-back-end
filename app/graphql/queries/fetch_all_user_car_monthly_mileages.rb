module Queries
  class FetchAllUserCarMonthlyMileages < Queries::BaseQuery
    type [Types::CarMonthlyMileage], null: true

    argument :user_id, Integer, required: true

    def resolve(user_id:)
      CarMonthlyMileage.fetch_all_user_car_monthly_mileages(user_id)
    end
  end
end
