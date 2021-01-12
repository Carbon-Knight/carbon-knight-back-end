module Mutations
  class CreateFootprintAndCarMonthlyMileage < Mutations::BaseMutation
    description "Create footprint for user with car id"

    argument :total_mileage, Integer, required: true
    argument :car_id, Integer, required: true
    argument :month, String, required: true
    argument :year, String, required: true

    field :footprint, Types::FootprintType, null: true

    def resolve(args)
      car = Car.find(args[:car_id])
      footprint = FootprintFacade.create_footprint(car, args[:total_mileage])


      CarMonthlyMileage.create(
        footprint_id: footprint.id,
        car_id: car.id,
        total_mileage: args[:total_mileage],
        month: args[:month],
        year: args[:year]
      )
      {
        footprint: footprint
      }
    end
  end
end
