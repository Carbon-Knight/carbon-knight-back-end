module Queries
  class FetchUserAggregateFootprintForYear < Queries::BaseQuery
    type Types::AggregateFootprintForYearType, null: true

    argument :user_id, Integer, required: true
    argument :year, String, required: true

    def resolve(args)
      months = Date::MONTHNAMES[1..12]
      yearly_footprints = Footprint.aggregate_footprint_for_year(args[:user_id], args[:year])
      footprints = months.length.times.each_with_object([]) do |index, output|
        output << {'month' => months[index],'carbon_in_kg' => yearly_footprints[months[index]]}
        index += 1
      end

      {"footprints" => footprints}
    end

  end
end
