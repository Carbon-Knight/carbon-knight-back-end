module Types
  class AggregateFootprintForYearType < Types::BaseObject
    field :footprints, [YearlyFootprintType], null: false
  end
end
