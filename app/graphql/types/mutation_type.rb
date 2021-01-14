module Types
  class MutationType < Types::BaseObject
    field :create_user_car, mutation: Mutations::CreateUserCar
    field :create_footprint_and_car_monthly_mileage, mutation: Mutations::CreateFootprintAndCarMonthlyMileage
    field :update_car_monthly_mileage, mutation: Mutations::UpdateCarMonthlyMileage
    field :delete_car_monthly_mileage, mutation: Mutations::DeleteCarMonthlyMileage
  end
end
