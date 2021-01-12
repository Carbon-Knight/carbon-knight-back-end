module Queries
  class FetchUserAggregateFootprintForYear < Queries::BaseQuery
    type [Types::AggregateFootprintForYearType], null: true

    argument :user_id, Integer, required: true
    argument :year, String, required: true

    def resolve(user_id:, year:)
      x = Footprint.aggregate_footprint_for_year(user_id, year)
      require "pry"; binding.pry
    end
  end
end


# code from PR gives error
# x = [#<Footprint:0x00007f9e2e1c6d48 id: nil>,
 #<Footprint:0x00007f9e2e1c6bb8 id: nil>,
 #<Footprint:0x00007f9e2e1c6a00 id: nil>]

# Previous code gives
# x = {:carbon_in_kg=>{"July"=>28.6, "June"=>28.6, "March"=>20.1}}
