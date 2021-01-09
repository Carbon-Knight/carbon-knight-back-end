module Queries 
  class FetchUserCars < Queries::BaseQuery
     type [Types::CarType], null: false 
     argument :user_id, Integer, required: true 
     
     def resolve(args)
        Car.where(user_id: args[:user_id])
     end
  end
end
