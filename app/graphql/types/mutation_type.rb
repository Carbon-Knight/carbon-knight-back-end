module Types
  class MutationType < Types::BaseObject
    field :create_user_car, mutation: Mutations::CreateUserCar
  end
end
