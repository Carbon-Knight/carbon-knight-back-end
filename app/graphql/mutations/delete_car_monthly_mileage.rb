module Mutations
  class DeleteCarMonthlyMileage < Mutations::BaseMutation
    description "Delete monthly milage and update footprint for car"

    argument :id, ID, required: true

    type Types::CarMonthlyMileage

    def resolve(args)
      cmm = CarMonthlyMileage.find(args[:id])
      cmm.destroy
      cmm.footprint.destroy
      cmm
    end
  end
end
