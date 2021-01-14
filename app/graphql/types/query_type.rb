module Types
  class QueryType < Types::BaseObject
    # /cars
    field :cars, [Types::CarType], null: false

    def cars
      Car.all
    end

    field :car, Types::CarType, null: false do
      argument :id, ID, required: true
    end

    def car(id:)
      Car.find(id)
    end

    field :car_monthly_mileage, Types::CarMonthlyMileage, null: false do
      argument :id, ID, required: true
    end

    def car_monthly_mileage(id:)
      ::CarMonthlyMileage.find(id)
    end

    field :fetch_user_cars, resolver: Queries::FetchUserCars
    field :fetch_user_car_month_footprint, resolver: Queries::FetchUserCarMonthFootprint
    field :fetch_user_aggregate_footprint_for_year, resolver: Queries::FetchUserAggregateFootprintForYear
    field :fetch_all_user_car_monthly_mileages, resolver: Queries::FetchAllUserCarMonthlyMileages
    field :fetch_user_footprint_years, resolver: Queries::FetchUserFootprintYears
  end
end
