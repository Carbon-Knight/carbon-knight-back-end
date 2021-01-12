module Queries
  class FetchUserAggregateFootprintForYear < Queries::BaseQuery
    type [Types::AggregateFootprintForYearType], null: true

    argument :user_id, Integer, required: true
    argument :year, String, required: true

    def resolve(user_id:, year:)
      z = Date::MONTHNAMES[1..12]
      x = Footprint.aggregate_footprint_for_year(user_id, year)
      array = []
      index = 0
      z.length.times do
        array << {'month' => z[index],'carbon_in_kg' => x[z[index].downcase]}
        index += 1
      end
      array
    end

  end
end
{"query": "{\n  fetchUserAggregateFootprintForYear(userId: 239, year: \"2077\"){\nmonth\ncarbonInKg\n}\n}"}
