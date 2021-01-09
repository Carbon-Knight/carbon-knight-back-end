module Types
  class MutationType < Types::BaseObject

    field :create_user_car, mutation: Mutations::CreateUserCar

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
