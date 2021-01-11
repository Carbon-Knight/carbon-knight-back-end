module Queries
  class FetchUserAggregateFootprint < Queries::BaseQuery
    type Types::AggregateFootprintType, null: true

    argument :user_id, Integer, required: true
    argument :month, String, required: true
    argument :year, String, required: true

    def resolve(user_id:, month:, year:)
      FootprintFacade.aggregate_footprint_for_month(user_id, month, year)
    end
  end
end
