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

    field :fetch_user_cars, resolver: Queries::FetchUserCars
  end
end
