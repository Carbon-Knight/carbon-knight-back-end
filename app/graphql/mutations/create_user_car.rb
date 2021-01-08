module Mutations 
  class CreateUserCar < Mutations::BaseMutation 
    description "Create a car for a user" 

    argument :user_id, Integer, required: true 
    argument :make, String, required: false 
    argument :model, String, required: false 
    argument :year, String, required: false 
    argument :mpg, Integer, required: true 
    argument :fuel_type, String, required: true 

    field :created_car, Types::CarType, null: true
    field :errors, [String], null: false

    def resolve(args)
      car = Car.create(
        user_id: args[:user_id],
        make: args[:make],
        model: args[:model],
        year: args[:year],
        mpg: args[:mpg],
        fuel_type: args[:fuel_type]
      )
      if car.save
        {
          created_car: car,
          errors: []
        }
      else
        {
          car: nil,
          errors: car.errors.full_messages
        }
      end
    end
  end
end
