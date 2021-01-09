module Types
  class QueryType < Types::BaseObject
    field :fetch_user_cars, resolver: Queries::FetchUserCars
    field :fetch_user_car_month_footprint, resolver: Queries::FetchUserCarMonthFootprint
  end
end
