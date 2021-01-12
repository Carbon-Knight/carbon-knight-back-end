module Queries
  class FetchUserAggregateFootprintForMonth < Queries::BaseQuery
    type Types::AggregateFootprintForMonthType, null: true

    argument :user_id, Integer, required: true
    argument :month, String, required: true
    argument :year, String, required: true

    def resolve(user_id:, month:, year:)
      Footprint.aggregate_footprint_for_month(user_id, month, year)
    end
  end
end
