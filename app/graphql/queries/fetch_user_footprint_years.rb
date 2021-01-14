module Queries
  class FetchUserFootprintYears < Queries::BaseQuery
    type Types::YearsType, null: true

    argument :user_id, Integer, required: true

    def resolve(user_id:)
      {
        years: CarMonthlyMileage.fetch_user_years(user_id)
      }
    end
  end
end
