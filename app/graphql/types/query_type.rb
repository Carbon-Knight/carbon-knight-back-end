module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # How to define query types: 
    # field <:query_name>, resolver: Queries::ClassName(defined in query_file.rb)
    # resolver: executes the logic in the resolve method of the above class 

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :fetch_user_cars, resolver: Queries::FetchUserCars
  end
end
