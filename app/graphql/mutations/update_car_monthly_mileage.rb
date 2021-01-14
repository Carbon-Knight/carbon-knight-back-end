module Mutations
  class UpdateCarMonthlyMileage < Mutations::BaseMutation
    description "Update monthly milagemand footprint for car"

    argument :total_mileage, Integer, required: true
    argument :id, Integer, required: true
    argument :month, String, required: true
    argument :year, Integer, required: true

    field :footprint, Types::FootprintType, null: true

    def resolve(args)
      car_monthly_mileage = CarMonthlyMileage.find(args[:id])

      car_monthly_mileage.update(total_mileage: args[:total_mileage])

      footprint = FootprintFacade.update_footprint(car_monthly_mileage)
      {
        footprint: footprint
      }
    end
  end
end
