module Mutations
  class UpdateCarMonthlyMileage < Mutations::BaseMutation
    description "Update monthly milagemand footprint for car"

    argument :total_mileage, Integer, required: true
    argument :car_id, Integer, required: true
    argument :month, String, required: true
    argument :year, String, required: true

    field :footprint, Types::FootprintType, null: true

    def resolve(args)

      car = Car.find(args[:car_id])

      car_monthly_mileage = CarMonthlyMileage.find_by(car_id: car.id, month: args[:month], year: args[:year])

      car_monthly_mileage.update(total_mileage: args[:total_mileage])

      footprint = FootprintFacade.update_footprint(car_monthly_mileage)
      {
        footprint: footprint
      }
    end
  end
end
