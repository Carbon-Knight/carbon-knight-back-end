module Types
  module Input
    class CarInputType < Types::BaseInputObject
      argument :user_id, String, required: true
      argument :make, String, required: false
      argument :model, String, required: false
      argument :year, String, required: false
      argument :mpg, String, required: true
      argument :fuel_type, String, required: true
    end
  end
end
